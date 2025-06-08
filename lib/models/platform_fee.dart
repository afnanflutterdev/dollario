import 'package:freezed_annotation/freezed_annotation.dart';
import 'currency.dart';

part 'platform_fee.freezed.dart';
part 'platform_fee.g.dart';

@freezed
class PlatformFee with _$PlatformFee {
  const factory PlatformFee({
    required String platform,
    required double percentage,
    required double fixedFee,
    required String currency,
    String? description,
  }) = _PlatformFee;

  factory PlatformFee.fromJson(Map<String, dynamic> json) => _$PlatformFeeFromJson(json);
}

@freezed
class ConversionResult with _$ConversionResult {
  const factory ConversionResult({
    required double originalAmount,
    required double platformFee,
    required double netAmount,
    required double finalAmount,
    required CurrencyPair currencyPair,
    required PlatformFee platform,
    required DateTime timestamp,
  }) = _ConversionResult;

  factory ConversionResult.fromJson(Map<String, dynamic> json) => _$ConversionResultFromJson(json);
} 