// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlatformFeeImpl _$$PlatformFeeImplFromJson(Map<String, dynamic> json) =>
    _$PlatformFeeImpl(
      platform: json['platform'] as String,
      percentage: (json['percentage'] as num).toDouble(),
      fixedFee: (json['fixedFee'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PlatformFeeImplToJson(_$PlatformFeeImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'percentage': instance.percentage,
      'fixedFee': instance.fixedFee,
      'currency': instance.currency,
      'description': instance.description,
    };

_$ConversionResultImpl _$$ConversionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversionResultImpl(
      originalAmount: (json['originalAmount'] as num).toDouble(),
      platformFee: (json['platformFee'] as num).toDouble(),
      netAmount: (json['netAmount'] as num).toDouble(),
      finalAmount: (json['finalAmount'] as num).toDouble(),
      currencyPair:
          CurrencyPair.fromJson(json['currencyPair'] as Map<String, dynamic>),
      platform: PlatformFee.fromJson(json['platform'] as Map<String, dynamic>),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ConversionResultImplToJson(
        _$ConversionResultImpl instance) =>
    <String, dynamic>{
      'originalAmount': instance.originalAmount,
      'platformFee': instance.platformFee,
      'netAmount': instance.netAmount,
      'finalAmount': instance.finalAmount,
      'currencyPair': instance.currencyPair,
      'platform': instance.platform,
      'timestamp': instance.timestamp.toIso8601String(),
    };
