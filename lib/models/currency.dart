import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required String code,
    required String name,
    required String symbol,
    required double rate,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}

@freezed
class CurrencyPair with _$CurrencyPair {
  const factory CurrencyPair({
    required Currency from,
    required Currency to,
    required double rate,
  }) = _CurrencyPair;

  factory CurrencyPair.fromJson(Map<String, dynamic> json) => _$CurrencyPairFromJson(json);
} 