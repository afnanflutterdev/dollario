import 'package:freezed_annotation/freezed_annotation.dart';
import 'platform_fee.dart';

part 'conversion_history.freezed.dart';
part 'conversion_history.g.dart';

@freezed
class ConversionHistory with _$ConversionHistory {
  const factory ConversionHistory({
    required String id,
    required ConversionResult result,
    required DateTime timestamp,
    @Default(false) bool isFavorite,
  }) = _ConversionHistory;

  factory ConversionHistory.fromJson(Map<String, dynamic> json) => _$ConversionHistoryFromJson(json);
} 