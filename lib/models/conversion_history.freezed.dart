// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversionHistory _$ConversionHistoryFromJson(Map<String, dynamic> json) {
  return _ConversionHistory.fromJson(json);
}

/// @nodoc
mixin _$ConversionHistory {
  String get id => throw _privateConstructorUsedError;
  ConversionResult get result => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this ConversionHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionHistoryCopyWith<ConversionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionHistoryCopyWith<$Res> {
  factory $ConversionHistoryCopyWith(
          ConversionHistory value, $Res Function(ConversionHistory) then) =
      _$ConversionHistoryCopyWithImpl<$Res, ConversionHistory>;
  @useResult
  $Res call(
      {String id,
      ConversionResult result,
      DateTime timestamp,
      bool isFavorite});

  $ConversionResultCopyWith<$Res> get result;
}

/// @nodoc
class _$ConversionHistoryCopyWithImpl<$Res, $Val extends ConversionHistory>
    implements $ConversionHistoryCopyWith<$Res> {
  _$ConversionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? result = null,
    Object? timestamp = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ConversionResult,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ConversionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionResultCopyWith<$Res> get result {
    return $ConversionResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversionHistoryImplCopyWith<$Res>
    implements $ConversionHistoryCopyWith<$Res> {
  factory _$$ConversionHistoryImplCopyWith(_$ConversionHistoryImpl value,
          $Res Function(_$ConversionHistoryImpl) then) =
      __$$ConversionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ConversionResult result,
      DateTime timestamp,
      bool isFavorite});

  @override
  $ConversionResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$ConversionHistoryImplCopyWithImpl<$Res>
    extends _$ConversionHistoryCopyWithImpl<$Res, _$ConversionHistoryImpl>
    implements _$$ConversionHistoryImplCopyWith<$Res> {
  __$$ConversionHistoryImplCopyWithImpl(_$ConversionHistoryImpl _value,
      $Res Function(_$ConversionHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? result = null,
    Object? timestamp = null,
    Object? isFavorite = null,
  }) {
    return _then(_$ConversionHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ConversionResult,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversionHistoryImpl implements _ConversionHistory {
  const _$ConversionHistoryImpl(
      {required this.id,
      required this.result,
      required this.timestamp,
      this.isFavorite = false});

  factory _$ConversionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversionHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final ConversionResult result;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'ConversionHistory(id: $id, result: $result, timestamp: $timestamp, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, result, timestamp, isFavorite);

  /// Create a copy of ConversionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionHistoryImplCopyWith<_$ConversionHistoryImpl> get copyWith =>
      __$$ConversionHistoryImplCopyWithImpl<_$ConversionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversionHistoryImplToJson(
      this,
    );
  }
}

abstract class _ConversionHistory implements ConversionHistory {
  const factory _ConversionHistory(
      {required final String id,
      required final ConversionResult result,
      required final DateTime timestamp,
      final bool isFavorite}) = _$ConversionHistoryImpl;

  factory _ConversionHistory.fromJson(Map<String, dynamic> json) =
      _$ConversionHistoryImpl.fromJson;

  @override
  String get id;
  @override
  ConversionResult get result;
  @override
  DateTime get timestamp;
  @override
  bool get isFavorite;

  /// Create a copy of ConversionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionHistoryImplCopyWith<_$ConversionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
