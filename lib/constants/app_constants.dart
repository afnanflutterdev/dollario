import '../models/platform_fee.dart';

class AppConstants {
  static const String appName = 'Dollario';
  static const String appTagline = 'Know Your Real Earnings';
  
  static const List<PlatformFee> platformFees = [
    PlatformFee(
      platform: 'PayPal',
      percentage: 2.9,
      fixedFee: 0.30,
      currency: 'USD',
      description: 'Standard PayPal fee for international transfers',
    ),
    PlatformFee(
      platform: 'Upwork',
      percentage: 10.0,
      fixedFee: 0.0,
      currency: 'USD',
      description: 'Upwork service fee for freelancers',
    ),
    PlatformFee(
      platform: 'Fiverr',
      percentage: 5.5,
      fixedFee: 2.0,
      currency: 'USD',
      description: 'Fiverr service fee for sellers',
    ),
    PlatformFee(
      platform: 'Wise',
      percentage: 0.0,
      fixedFee: 0.0,
      currency: 'USD',
      description: 'Wise uses real exchange rates with minimal fees',
    ),
    PlatformFee(
      platform: 'Payoneer',
      percentage: 1.0,
      fixedFee: 0.0,
      currency: 'USD',
      description: 'Payoneer withdrawal fee',
    ),
  ];

  static const List<String> supportedCurrencies = [
    'PKR', // Pakistan
    'INR', // India
    'BDT', // Bangladesh
    'NGN', // Nigeria
    'PHP', // Philippines
    'USD', // United States
    'EUR', // European Union
    'GBP', // United Kingdom
  ];

  static const String exchangeRateApiUrl = 'https://v6.exchangerate-api.com/v6/f1bb4fd03e9f7ba40b6dd449/latest/USD';
  
  static const Map<String, String> currencyNames = {
    'PKR': 'Pakistani Rupee',
    'INR': 'Indian Rupee',
    'BDT': 'Bangladeshi Taka',
    'NGN': 'Nigerian Naira',
    'PHP': 'Philippine Peso',
    'USD': 'United States Dollar',
    'EUR': 'Euro',
    'GBP': 'British Pound',
  };

  static const Map<String, String> currencySymbols = {
    'PKR': '₨',
    'INR': '₹',
    'BDT': '৳',
    'NGN': '₦',
    'PHP': '₱',
    'USD': '\$',
    'EUR': '€',
    'GBP': '£',
  };
} 