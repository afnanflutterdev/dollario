// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionHistoryImpl _$$ConversionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversionHistoryImpl(
      id: json['id'] as String,
      result: ConversionResult.fromJson(json['result'] as Map<String, dynamic>),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$ConversionHistoryImplToJson(
        _$ConversionHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
      'timestamp': instance.timestamp.toIso8601String(),
      'isFavorite': instance.isFavorite,
    };
