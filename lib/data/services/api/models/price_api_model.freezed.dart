// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriceApiModel {

 int get timestamp; double get value;
/// Create a copy of PriceApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceApiModelCopyWith<PriceApiModel> get copyWith => _$PriceApiModelCopyWithImpl<PriceApiModel>(this as PriceApiModel, _$identity);

  /// Serializes this PriceApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceApiModel&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,value);

@override
String toString() {
  return 'PriceApiModel(timestamp: $timestamp, value: $value)';
}


}

/// @nodoc
abstract mixin class $PriceApiModelCopyWith<$Res>  {
  factory $PriceApiModelCopyWith(PriceApiModel value, $Res Function(PriceApiModel) _then) = _$PriceApiModelCopyWithImpl;
@useResult
$Res call({
 int timestamp, double value
});




}
/// @nodoc
class _$PriceApiModelCopyWithImpl<$Res>
    implements $PriceApiModelCopyWith<$Res> {
  _$PriceApiModelCopyWithImpl(this._self, this._then);

  final PriceApiModel _self;
  final $Res Function(PriceApiModel) _then;

/// Create a copy of PriceApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? value = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceApiModel].
extension PriceApiModelPatterns on PriceApiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceApiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceApiModel value)  $default,){
final _that = this;
switch (_that) {
case _PriceApiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _PriceApiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int timestamp,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceApiModel() when $default != null:
return $default(_that.timestamp,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int timestamp,  double value)  $default,) {final _that = this;
switch (_that) {
case _PriceApiModel():
return $default(_that.timestamp,_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int timestamp,  double value)?  $default,) {final _that = this;
switch (_that) {
case _PriceApiModel() when $default != null:
return $default(_that.timestamp,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceApiModel implements PriceApiModel {
  const _PriceApiModel({required this.timestamp, required this.value});
  factory _PriceApiModel.fromJson(Map<String, dynamic> json) => _$PriceApiModelFromJson(json);

@override final  int timestamp;
@override final  double value;

/// Create a copy of PriceApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceApiModelCopyWith<_PriceApiModel> get copyWith => __$PriceApiModelCopyWithImpl<_PriceApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceApiModel&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,value);

@override
String toString() {
  return 'PriceApiModel(timestamp: $timestamp, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PriceApiModelCopyWith<$Res> implements $PriceApiModelCopyWith<$Res> {
  factory _$PriceApiModelCopyWith(_PriceApiModel value, $Res Function(_PriceApiModel) _then) = __$PriceApiModelCopyWithImpl;
@override @useResult
$Res call({
 int timestamp, double value
});




}
/// @nodoc
class __$PriceApiModelCopyWithImpl<$Res>
    implements _$PriceApiModelCopyWith<$Res> {
  __$PriceApiModelCopyWithImpl(this._self, this._then);

  final _PriceApiModel _self;
  final $Res Function(_PriceApiModel) _then;

/// Create a copy of PriceApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? value = null,}) {
  return _then(_PriceApiModel(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
