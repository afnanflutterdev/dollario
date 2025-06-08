// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlatformFee _$PlatformFeeFromJson(Map<String, dynamic> json) {
  return _PlatformFee.fromJson(json);
}

/// @nodoc
mixin _$PlatformFee {
  String get platform => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  double get fixedFee => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PlatformFee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformFeeCopyWith<PlatformFee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformFeeCopyWith<$Res> {
  factory $PlatformFeeCopyWith(
          PlatformFee value, $Res Function(PlatformFee) then) =
      _$PlatformFeeCopyWithImpl<$Res, PlatformFee>;
  @useResult
  $Res call(
      {String platform,
      double percentage,
      double fixedFee,
      String currency,
      String? description});
}

/// @nodoc
class _$PlatformFeeCopyWithImpl<$Res, $Val extends PlatformFee>
    implements $PlatformFeeCopyWith<$Res> {
  _$PlatformFeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? percentage = null,
    Object? fixedFee = null,
    Object? currency = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      fixedFee: null == fixedFee
          ? _value.fixedFee
          : fixedFee // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformFeeImplCopyWith<$Res>
    implements $PlatformFeeCopyWith<$Res> {
  factory _$$PlatformFeeImplCopyWith(
          _$PlatformFeeImpl value, $Res Function(_$PlatformFeeImpl) then) =
      __$$PlatformFeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String platform,
      double percentage,
      double fixedFee,
      String currency,
      String? description});
}

/// @nodoc
class __$$PlatformFeeImplCopyWithImpl<$Res>
    extends _$PlatformFeeCopyWithImpl<$Res, _$PlatformFeeImpl>
    implements _$$PlatformFeeImplCopyWith<$Res> {
  __$$PlatformFeeImplCopyWithImpl(
      _$PlatformFeeImpl _value, $Res Function(_$PlatformFeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformFee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? percentage = null,
    Object? fixedFee = null,
    Object? currency = null,
    Object? description = freezed,
  }) {
    return _then(_$PlatformFeeImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      fixedFee: null == fixedFee
          ? _value.fixedFee
          : fixedFee // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformFeeImpl implements _PlatformFee {
  const _$PlatformFeeImpl(
      {required this.platform,
      required this.percentage,
      required this.fixedFee,
      required this.currency,
      this.description});

  factory _$PlatformFeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformFeeImplFromJson(json);

  @override
  final String platform;
  @override
  final double percentage;
  @override
  final double fixedFee;
  @override
  final String currency;
  @override
  final String? description;

  @override
  String toString() {
    return 'PlatformFee(platform: $platform, percentage: $percentage, fixedFee: $fixedFee, currency: $currency, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformFeeImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.fixedFee, fixedFee) ||
                other.fixedFee == fixedFee) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, platform, percentage, fixedFee, currency, description);

  /// Create a copy of PlatformFee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformFeeImplCopyWith<_$PlatformFeeImpl> get copyWith =>
      __$$PlatformFeeImplCopyWithImpl<_$PlatformFeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformFeeImplToJson(
      this,
    );
  }
}

abstract class _PlatformFee implements PlatformFee {
  const factory _PlatformFee(
      {required final String platform,
      required final double percentage,
      required final double fixedFee,
      required final String currency,
      final String? description}) = _$PlatformFeeImpl;

  factory _PlatformFee.fromJson(Map<String, dynamic> json) =
      _$PlatformFeeImpl.fromJson;

  @override
  String get platform;
  @override
  double get percentage;
  @override
  double get fixedFee;
  @override
  String get currency;
  @override
  String? get description;

  /// Create a copy of PlatformFee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformFeeImplCopyWith<_$PlatformFeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConversionResult _$ConversionResultFromJson(Map<String, dynamic> json) {
  return _ConversionResult.fromJson(json);
}

/// @nodoc
mixin _$ConversionResult {
  double get originalAmount => throw _privateConstructorUsedError;
  double get platformFee => throw _privateConstructorUsedError;
  double get netAmount => throw _privateConstructorUsedError;
  double get finalAmount => throw _privateConstructorUsedError;
  CurrencyPair get currencyPair => throw _privateConstructorUsedError;
  PlatformFee get platform => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ConversionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionResultCopyWith<ConversionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionResultCopyWith<$Res> {
  factory $ConversionResultCopyWith(
          ConversionResult value, $Res Function(ConversionResult) then) =
      _$ConversionResultCopyWithImpl<$Res, ConversionResult>;
  @useResult
  $Res call(
      {double originalAmount,
      double platformFee,
      double netAmount,
      double finalAmount,
      CurrencyPair currencyPair,
      PlatformFee platform,
      DateTime timestamp});

  $CurrencyPairCopyWith<$Res> get currencyPair;
  $PlatformFeeCopyWith<$Res> get platform;
}

/// @nodoc
class _$ConversionResultCopyWithImpl<$Res, $Val extends ConversionResult>
    implements $ConversionResultCopyWith<$Res> {
  _$ConversionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAmount = null,
    Object? platformFee = null,
    Object? netAmount = null,
    Object? finalAmount = null,
    Object? currencyPair = null,
    Object? platform = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      originalAmount: null == originalAmount
          ? _value.originalAmount
          : originalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currencyPair: null == currencyPair
          ? _value.currencyPair
          : currencyPair // ignore: cast_nullable_to_non_nullable
              as CurrencyPair,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformFee,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyPairCopyWith<$Res> get currencyPair {
    return $CurrencyPairCopyWith<$Res>(_value.currencyPair, (value) {
      return _then(_value.copyWith(currencyPair: value) as $Val);
    });
  }

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformFeeCopyWith<$Res> get platform {
    return $PlatformFeeCopyWith<$Res>(_value.platform, (value) {
      return _then(_value.copyWith(platform: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversionResultImplCopyWith<$Res>
    implements $ConversionResultCopyWith<$Res> {
  factory _$$ConversionResultImplCopyWith(_$ConversionResultImpl value,
          $Res Function(_$ConversionResultImpl) then) =
      __$$ConversionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double originalAmount,
      double platformFee,
      double netAmount,
      double finalAmount,
      CurrencyPair currencyPair,
      PlatformFee platform,
      DateTime timestamp});

  @override
  $CurrencyPairCopyWith<$Res> get currencyPair;
  @override
  $PlatformFeeCopyWith<$Res> get platform;
}

/// @nodoc
class __$$ConversionResultImplCopyWithImpl<$Res>
    extends _$ConversionResultCopyWithImpl<$Res, _$ConversionResultImpl>
    implements _$$ConversionResultImplCopyWith<$Res> {
  __$$ConversionResultImplCopyWithImpl(_$ConversionResultImpl _value,
      $Res Function(_$ConversionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAmount = null,
    Object? platformFee = null,
    Object? netAmount = null,
    Object? finalAmount = null,
    Object? currencyPair = null,
    Object? platform = null,
    Object? timestamp = null,
  }) {
    return _then(_$ConversionResultImpl(
      originalAmount: null == originalAmount
          ? _value.originalAmount
          : originalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currencyPair: null == currencyPair
          ? _value.currencyPair
          : currencyPair // ignore: cast_nullable_to_non_nullable
              as CurrencyPair,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformFee,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversionResultImpl implements _ConversionResult {
  const _$ConversionResultImpl(
      {required this.originalAmount,
      required this.platformFee,
      required this.netAmount,
      required this.finalAmount,
      required this.currencyPair,
      required this.platform,
      required this.timestamp});

  factory _$ConversionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionResultImplFromJson(json);

  @override
  final double originalAmount;
  @override
  final double platformFee;
  @override
  final double netAmount;
  @override
  final double finalAmount;
  @override
  final CurrencyPair currencyPair;
  @override
  final PlatformFee platform;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ConversionResult(originalAmount: $originalAmount, platformFee: $platformFee, netAmount: $netAmount, finalAmount: $finalAmount, currencyPair: $currencyPair, platform: $platform, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionResultImpl &&
            (identical(other.originalAmount, originalAmount) ||
                other.originalAmount == originalAmount) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.currencyPair, currencyPair) ||
                other.currencyPair == currencyPair) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, originalAmount, platformFee,
      netAmount, finalAmount, currencyPair, platform, timestamp);

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionResultImplCopyWith<_$ConversionResultImpl> get copyWith =>
      __$$ConversionResultImplCopyWithImpl<_$ConversionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversionResultImplToJson(
      this,
    );
  }
}

abstract class _ConversionResult implements ConversionResult {
  const factory _ConversionResult(
      {required final double originalAmount,
      required final double platformFee,
      required final double netAmount,
      required final double finalAmount,
      required final CurrencyPair currencyPair,
      required final PlatformFee platform,
      required final DateTime timestamp}) = _$ConversionResultImpl;

  factory _ConversionResult.fromJson(Map<String, dynamic> json) =
      _$ConversionResultImpl.fromJson;

  @override
  double get originalAmount;
  @override
  double get platformFee;
  @override
  double get netAmount;
  @override
  double get finalAmount;
  @override
  CurrencyPair get currencyPair;
  @override
  PlatformFee get platform;
  @override
  DateTime get timestamp;

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionResultImplCopyWith<_$ConversionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
