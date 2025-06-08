import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/currency.dart';

class ExchangeRateService {
  final String baseUrl = AppConstants.exchangeRateApiUrl;

  Future<Map<String, double>> getLatestRates() async {
    try {
      print('Fetching exchange rates from: $baseUrl?base=USD');
      final response = await http.get(Uri.parse('$baseUrl?base=USD'));
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['conversion_rates'] == null) {
          throw Exception('Invalid response format: conversion_rates field is missing');
        }
        final rates = Map<String, double>.from(data['conversion_rates']);
        return rates;
      } else {
        throw Exception('Failed to load exchange rates: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error fetching exchange rates: $e');
      throw Exception('Error fetching exchange rates: $e');
    }
  }

  Future<List<Currency>> getSupportedCurrencies() async {
    try {
      final rates = await getLatestRates();
      return AppConstants.supportedCurrencies.map((code) {
        final rate = rates[code];
        if (rate == null) {
          print('Warning: No exchange rate found for $code');
        }
        return Currency(
          code: code,
          name: AppConstants.currencyNames[code] ?? code,
          symbol: AppConstants.currencySymbols[code] ?? code,
          rate: rate ?? 1.0,
        );
      }).toList();
    } catch (e) {
      print('Error getting supported currencies: $e');
      throw Exception('Error getting supported currencies: $e');
    }
  }

  Future<CurrencyPair> getCurrencyPair(String fromCode, String toCode) async {
    try {
      print('Getting currency pair: $fromCode -> $toCode');
      final rates = await getLatestRates();
      
      if (!rates.containsKey(toCode)) {
        throw Exception('Exchange rate not found for $toCode');
      }
      
      final fromCurrency = Currency(
        code: fromCode,
        name: AppConstants.currencyNames[fromCode] ?? fromCode,
        symbol: AppConstants.currencySymbols[fromCode] ?? fromCode,
        rate: 1.0,
      );
      
      final toCurrency = Currency(
        code: toCode,
        name: AppConstants.currencyNames[toCode] ?? toCode,
        symbol: AppConstants.currencySymbols[toCode] ?? toCode,
        rate: rates[toCode] ?? 1.0,
      );

      print('Created currency pair with rate: ${toCurrency.rate}');
      return CurrencyPair(
        from: fromCurrency,
        to: toCurrency,
        rate: toCurrency.rate,
      );
    } catch (e) {
      print('Error getting currency pair: $e');
      throw Exception('Error getting currency pair: $e');
    }
  }
} 