// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call({String code, String name, String symbol, double rate});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
          _$CurrencyImpl value, $Res Function(_$CurrencyImpl) then) =
      __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String symbol, double rate});
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
      _$CurrencyImpl _value, $Res Function(_$CurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
    Object? rate = null,
  }) {
    return _then(_$CurrencyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyImpl implements _Currency {
  const _$CurrencyImpl(
      {required this.code,
      required this.name,
      required this.symbol,
      required this.rate});

  factory _$CurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final double rate;

  @override
  String toString() {
    return 'Currency(code: $code, name: $name, symbol: $symbol, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, symbol, rate);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyImplToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {required final String code,
      required final String name,
      required final String symbol,
      required final double rate}) = _$CurrencyImpl;

  factory _Currency.fromJson(Map<String, dynamic> json) =
      _$CurrencyImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get symbol;
  @override
  double get rate;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrencyPair _$CurrencyPairFromJson(Map<String, dynamic> json) {
  return _CurrencyPair.fromJson(json);
}

/// @nodoc
mixin _$CurrencyPair {
  Currency get from => throw _privateConstructorUsedError;
  Currency get to => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  /// Serializes this CurrencyPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyPairCopyWith<CurrencyPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyPairCopyWith<$Res> {
  factory $CurrencyPairCopyWith(
          CurrencyPair value, $Res Function(CurrencyPair) then) =
      _$CurrencyPairCopyWithImpl<$Res, CurrencyPair>;
  @useResult
  $Res call({Currency from, Currency to, double rate});

  $CurrencyCopyWith<$Res> get from;
  $CurrencyCopyWith<$Res> get to;
}

/// @nodoc
class _$CurrencyPairCopyWithImpl<$Res, $Val extends CurrencyPair>
    implements $CurrencyPairCopyWith<$Res> {
  _$CurrencyPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get from {
    return $CurrencyCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get to {
    return $CurrencyCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyPairImplCopyWith<$Res>
    implements $CurrencyPairCopyWith<$Res> {
  factory _$$CurrencyPairImplCopyWith(
          _$CurrencyPairImpl value, $Res Function(_$CurrencyPairImpl) then) =
      __$$CurrencyPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Currency from, Currency to, double rate});

  @override
  $CurrencyCopyWith<$Res> get from;
  @override
  $CurrencyCopyWith<$Res> get to;
}

/// @nodoc
class __$$CurrencyPairImplCopyWithImpl<$Res>
    extends _$CurrencyPairCopyWithImpl<$Res, _$CurrencyPairImpl>
    implements _$$CurrencyPairImplCopyWith<$Res> {
  __$$CurrencyPairImplCopyWithImpl(
      _$CurrencyPairImpl _value, $Res Function(_$CurrencyPairImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? rate = null,
  }) {
    return _then(_$CurrencyPairImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Currency,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Currency,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyPairImpl implements _CurrencyPair {
  const _$CurrencyPairImpl(
      {required this.from, required this.to, required this.rate});

  factory _$CurrencyPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyPairImplFromJson(json);

  @override
  final Currency from;
  @override
  final Currency to;
  @override
  final double rate;

  @override
  String toString() {
    return 'CurrencyPair(from: $from, to: $to, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyPairImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, rate);

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyPairImplCopyWith<_$CurrencyPairImpl> get copyWith =>
      __$$CurrencyPairImplCopyWithImpl<_$CurrencyPairImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyPairImplToJson(
      this,
    );
  }
}

abstract class _CurrencyPair implements CurrencyPair {
  const factory _CurrencyPair(
      {required final Currency from,
      required final Currency to,
      required final double rate}) = _$CurrencyPairImpl;

  factory _CurrencyPair.fromJson(Map<String, dynamic> json) =
      _$CurrencyPairImpl.fromJson;

  @override
  Currency get from;
  @override
  Currency get to;
  @override
  double get rate;

  /// Create a copy of CurrencyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyPairImplCopyWith<_$CurrencyPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
