// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Market {

 List<List<double>> get prices; List<List<double>> get marketCaps; List<List<double>> get totalVolumes;
/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketCopyWith<Market> get copyWith => _$MarketCopyWithImpl<Market>(this as Market, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Market&&const DeepCollectionEquality().equals(other.prices, prices)&&const DeepCollectionEquality().equals(other.marketCaps, marketCaps)&&const DeepCollectionEquality().equals(other.totalVolumes, totalVolumes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(prices),const DeepCollectionEquality().hash(marketCaps),const DeepCollectionEquality().hash(totalVolumes));

@override
String toString() {
  return 'Market(prices: $prices, marketCaps: $marketCaps, totalVolumes: $totalVolumes)';
}


}

/// @nodoc
abstract mixin class $MarketCopyWith<$Res>  {
  factory $MarketCopyWith(Market value, $Res Function(Market) _then) = _$MarketCopyWithImpl;
@useResult
$Res call({
 List<List<double>> prices, List<List<double>> marketCaps, List<List<double>> totalVolumes
});




}
/// @nodoc
class _$MarketCopyWithImpl<$Res>
    implements $MarketCopyWith<$Res> {
  _$MarketCopyWithImpl(this._self, this._then);

  final Market _self;
  final $Res Function(Market) _then;

/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prices = null,Object? marketCaps = null,Object? totalVolumes = null,}) {
  return _then(_self.copyWith(
prices: null == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<List<double>>,marketCaps: null == marketCaps ? _self.marketCaps : marketCaps // ignore: cast_nullable_to_non_nullable
as List<List<double>>,totalVolumes: null == totalVolumes ? _self.totalVolumes : totalVolumes // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}

}


/// Adds pattern-matching-related methods to [Market].
extension MarketPatterns on Market {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Market value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Market() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Market value)  $default,){
final _that = this;
switch (_that) {
case _Market():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Market value)?  $default,){
final _that = this;
switch (_that) {
case _Market() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<List<double>> prices,  List<List<double>> marketCaps,  List<List<double>> totalVolumes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Market() when $default != null:
return $default(_that.prices,_that.marketCaps,_that.totalVolumes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<List<double>> prices,  List<List<double>> marketCaps,  List<List<double>> totalVolumes)  $default,) {final _that = this;
switch (_that) {
case _Market():
return $default(_that.prices,_that.marketCaps,_that.totalVolumes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<List<double>> prices,  List<List<double>> marketCaps,  List<List<double>> totalVolumes)?  $default,) {final _that = this;
switch (_that) {
case _Market() when $default != null:
return $default(_that.prices,_that.marketCaps,_that.totalVolumes);case _:
  return null;

}
}

}

/// @nodoc


class _Market implements Market {
  const _Market({required final  List<List<double>> prices, required final  List<List<double>> marketCaps, required final  List<List<double>> totalVolumes}): _prices = prices,_marketCaps = marketCaps,_totalVolumes = totalVolumes;
  

 final  List<List<double>> _prices;
@override List<List<double>> get prices {
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prices);
}

 final  List<List<double>> _marketCaps;
@override List<List<double>> get marketCaps {
  if (_marketCaps is EqualUnmodifiableListView) return _marketCaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marketCaps);
}

 final  List<List<double>> _totalVolumes;
@override List<List<double>> get totalVolumes {
  if (_totalVolumes is EqualUnmodifiableListView) return _totalVolumes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_totalVolumes);
}


/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketCopyWith<_Market> get copyWith => __$MarketCopyWithImpl<_Market>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Market&&const DeepCollectionEquality().equals(other._prices, _prices)&&const DeepCollectionEquality().equals(other._marketCaps, _marketCaps)&&const DeepCollectionEquality().equals(other._totalVolumes, _totalVolumes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_prices),const DeepCollectionEquality().hash(_marketCaps),const DeepCollectionEquality().hash(_totalVolumes));

@override
String toString() {
  return 'Market(prices: $prices, marketCaps: $marketCaps, totalVolumes: $totalVolumes)';
}


}

/// @nodoc
abstract mixin class _$MarketCopyWith<$Res> implements $MarketCopyWith<$Res> {
  factory _$MarketCopyWith(_Market value, $Res Function(_Market) _then) = __$MarketCopyWithImpl;
@override @useResult
$Res call({
 List<List<double>> prices, List<List<double>> marketCaps, List<List<double>> totalVolumes
});




}
/// @nodoc
class __$MarketCopyWithImpl<$Res>
    implements _$MarketCopyWith<$Res> {
  __$MarketCopyWithImpl(this._self, this._then);

  final _Market _self;
  final $Res Function(_Market) _then;

/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prices = null,Object? marketCaps = null,Object? totalVolumes = null,}) {
  return _then(_Market(
prices: null == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<List<double>>,marketCaps: null == marketCaps ? _self._marketCaps : marketCaps // ignore: cast_nullable_to_non_nullable
as List<List<double>>,totalVolumes: null == totalVolumes ? _self._totalVolumes : totalVolumes // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}


}

// dart format on
