// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sparkline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sparkline {

 List<double> get price;
/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SparklineCopyWith<Sparkline> get copyWith => _$SparklineCopyWithImpl<Sparkline>(this as Sparkline, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sparkline&&const DeepCollectionEquality().equals(other.price, price));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(price));

@override
String toString() {
  return 'Sparkline(price: $price)';
}


}

/// @nodoc
abstract mixin class $SparklineCopyWith<$Res>  {
  factory $SparklineCopyWith(Sparkline value, $Res Function(Sparkline) _then) = _$SparklineCopyWithImpl;
@useResult
$Res call({
 List<double> price
});




}
/// @nodoc
class _$SparklineCopyWithImpl<$Res>
    implements $SparklineCopyWith<$Res> {
  _$SparklineCopyWithImpl(this._self, this._then);

  final Sparkline _self;
  final $Res Function(Sparkline) _then;

/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sparkline].
extension SparklinePatterns on Sparkline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sparkline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sparkline value)  $default,){
final _that = this;
switch (_that) {
case _Sparkline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sparkline value)?  $default,){
final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<double> price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
return $default(_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<double> price)  $default,) {final _that = this;
switch (_that) {
case _Sparkline():
return $default(_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<double> price)?  $default,) {final _that = this;
switch (_that) {
case _Sparkline() when $default != null:
return $default(_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _Sparkline implements Sparkline {
  const _Sparkline({required final  List<double> price}): _price = price;
  

 final  List<double> _price;
@override List<double> get price {
  if (_price is EqualUnmodifiableListView) return _price;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_price);
}


/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SparklineCopyWith<_Sparkline> get copyWith => __$SparklineCopyWithImpl<_Sparkline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sparkline&&const DeepCollectionEquality().equals(other._price, _price));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_price));

@override
String toString() {
  return 'Sparkline(price: $price)';
}


}

/// @nodoc
abstract mixin class _$SparklineCopyWith<$Res> implements $SparklineCopyWith<$Res> {
  factory _$SparklineCopyWith(_Sparkline value, $Res Function(_Sparkline) _then) = __$SparklineCopyWithImpl;
@override @useResult
$Res call({
 List<double> price
});




}
/// @nodoc
class __$SparklineCopyWithImpl<$Res>
    implements _$SparklineCopyWith<$Res> {
  __$SparklineCopyWithImpl(this._self, this._then);

  final _Sparkline _self;
  final $Res Function(_Sparkline) _then;

/// Create a copy of Sparkline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,}) {
  return _then(_Sparkline(
price: null == price ? _self._price : price // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
