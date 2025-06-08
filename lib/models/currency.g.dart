// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
      'rate': instance.rate,
    };

_$CurrencyPairImpl _$$CurrencyPairImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyPairImpl(
      from: Currency.fromJson(json['from'] as Map<String, dynamic>),
      to: Currency.fromJson(json['to'] as Map<String, dynamic>),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrencyPairImplToJson(_$CurrencyPairImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'rate': instance.rate,
    };
