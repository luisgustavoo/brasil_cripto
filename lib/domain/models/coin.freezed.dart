// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Coin {

 String get id; String get symbol; String get name; String get image; double get currentPrice; double get marketCap; int get marketCapRank; double get totalVolume; Sparkline get sparkLineIn7d; double get priceChangePercentage1hInCurrency; double get priceChangePercentage24hInCurrency; double get priceChangePercentage7dInCurrency; bool get isFavorite;
/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinCopyWith<Coin> get copyWith => _$CoinCopyWithImpl<Coin>(this as Coin, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coin&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.sparkLineIn7d, sparkLineIn7d) || other.sparkLineIn7d == sparkLineIn7d)&&(identical(other.priceChangePercentage1hInCurrency, priceChangePercentage1hInCurrency) || other.priceChangePercentage1hInCurrency == priceChangePercentage1hInCurrency)&&(identical(other.priceChangePercentage24hInCurrency, priceChangePercentage24hInCurrency) || other.priceChangePercentage24hInCurrency == priceChangePercentage24hInCurrency)&&(identical(other.priceChangePercentage7dInCurrency, priceChangePercentage7dInCurrency) || other.priceChangePercentage7dInCurrency == priceChangePercentage7dInCurrency)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,currentPrice,marketCap,marketCapRank,totalVolume,sparkLineIn7d,priceChangePercentage1hInCurrency,priceChangePercentage24hInCurrency,priceChangePercentage7dInCurrency,isFavorite);

@override
String toString() {
  return 'Coin(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, totalVolume: $totalVolume, sparkLineIn7d: $sparkLineIn7d, priceChangePercentage1hInCurrency: $priceChangePercentage1hInCurrency, priceChangePercentage24hInCurrency: $priceChangePercentage24hInCurrency, priceChangePercentage7dInCurrency: $priceChangePercentage7dInCurrency, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $CoinCopyWith<$Res>  {
  factory $CoinCopyWith(Coin value, $Res Function(Coin) _then) = _$CoinCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, String image, double currentPrice, double marketCap, int marketCapRank, double totalVolume, Sparkline sparkLineIn7d, double priceChangePercentage1hInCurrency, double priceChangePercentage24hInCurrency, double priceChangePercentage7dInCurrency, bool isFavorite
});


$SparklineCopyWith<$Res> get sparkLineIn7d;

}
/// @nodoc
class _$CoinCopyWithImpl<$Res>
    implements $CoinCopyWith<$Res> {
  _$CoinCopyWithImpl(this._self, this._then);

  final Coin _self;
  final $Res Function(Coin) _then;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? currentPrice = null,Object? marketCap = null,Object? marketCapRank = null,Object? totalVolume = null,Object? sparkLineIn7d = null,Object? priceChangePercentage1hInCurrency = null,Object? priceChangePercentage24hInCurrency = null,Object? priceChangePercentage7dInCurrency = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double,sparkLineIn7d: null == sparkLineIn7d ? _self.sparkLineIn7d : sparkLineIn7d // ignore: cast_nullable_to_non_nullable
as Sparkline,priceChangePercentage1hInCurrency: null == priceChangePercentage1hInCurrency ? _self.priceChangePercentage1hInCurrency : priceChangePercentage1hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage24hInCurrency: null == priceChangePercentage24hInCurrency ? _self.priceChangePercentage24hInCurrency : priceChangePercentage24hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage7dInCurrency: null == priceChangePercentage7dInCurrency ? _self.priceChangePercentage7dInCurrency : priceChangePercentage7dInCurrency // ignore: cast_nullable_to_non_nullable
as double,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SparklineCopyWith<$Res> get sparkLineIn7d {
  
  return $SparklineCopyWith<$Res>(_self.sparkLineIn7d, (value) {
    return _then(_self.copyWith(sparkLineIn7d: value));
  });
}
}


/// Adds pattern-matching-related methods to [Coin].
extension CoinPatterns on Coin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coin value)  $default,){
final _that = this;
switch (_that) {
case _Coin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coin value)?  $default,){
final _that = this;
switch (_that) {
case _Coin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String image,  double currentPrice,  double marketCap,  int marketCapRank,  double totalVolume,  Sparkline sparkLineIn7d,  double priceChangePercentage1hInCurrency,  double priceChangePercentage24hInCurrency,  double priceChangePercentage7dInCurrency,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coin() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.totalVolume,_that.sparkLineIn7d,_that.priceChangePercentage1hInCurrency,_that.priceChangePercentage24hInCurrency,_that.priceChangePercentage7dInCurrency,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String image,  double currentPrice,  double marketCap,  int marketCapRank,  double totalVolume,  Sparkline sparkLineIn7d,  double priceChangePercentage1hInCurrency,  double priceChangePercentage24hInCurrency,  double priceChangePercentage7dInCurrency,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _Coin():
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.totalVolume,_that.sparkLineIn7d,_that.priceChangePercentage1hInCurrency,_that.priceChangePercentage24hInCurrency,_that.priceChangePercentage7dInCurrency,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  String image,  double currentPrice,  double marketCap,  int marketCapRank,  double totalVolume,  Sparkline sparkLineIn7d,  double priceChangePercentage1hInCurrency,  double priceChangePercentage24hInCurrency,  double priceChangePercentage7dInCurrency,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _Coin() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.totalVolume,_that.sparkLineIn7d,_that.priceChangePercentage1hInCurrency,_that.priceChangePercentage24hInCurrency,_that.priceChangePercentage7dInCurrency,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _Coin implements Coin {
  const _Coin({required this.id, required this.symbol, required this.name, required this.image, required this.currentPrice, required this.marketCap, required this.marketCapRank, required this.totalVolume, required this.sparkLineIn7d, required this.priceChangePercentage1hInCurrency, required this.priceChangePercentage24hInCurrency, required this.priceChangePercentage7dInCurrency, this.isFavorite = false});
  

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  String image;
@override final  double currentPrice;
@override final  double marketCap;
@override final  int marketCapRank;
@override final  double totalVolume;
@override final  Sparkline sparkLineIn7d;
@override final  double priceChangePercentage1hInCurrency;
@override final  double priceChangePercentage24hInCurrency;
@override final  double priceChangePercentage7dInCurrency;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinCopyWith<_Coin> get copyWith => __$CoinCopyWithImpl<_Coin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coin&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.sparkLineIn7d, sparkLineIn7d) || other.sparkLineIn7d == sparkLineIn7d)&&(identical(other.priceChangePercentage1hInCurrency, priceChangePercentage1hInCurrency) || other.priceChangePercentage1hInCurrency == priceChangePercentage1hInCurrency)&&(identical(other.priceChangePercentage24hInCurrency, priceChangePercentage24hInCurrency) || other.priceChangePercentage24hInCurrency == priceChangePercentage24hInCurrency)&&(identical(other.priceChangePercentage7dInCurrency, priceChangePercentage7dInCurrency) || other.priceChangePercentage7dInCurrency == priceChangePercentage7dInCurrency)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,id,symbol,name,image,currentPrice,marketCap,marketCapRank,totalVolume,sparkLineIn7d,priceChangePercentage1hInCurrency,priceChangePercentage24hInCurrency,priceChangePercentage7dInCurrency,isFavorite);

@override
String toString() {
  return 'Coin(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, totalVolume: $totalVolume, sparkLineIn7d: $sparkLineIn7d, priceChangePercentage1hInCurrency: $priceChangePercentage1hInCurrency, priceChangePercentage24hInCurrency: $priceChangePercentage24hInCurrency, priceChangePercentage7dInCurrency: $priceChangePercentage7dInCurrency, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$CoinCopyWith<$Res> implements $CoinCopyWith<$Res> {
  factory _$CoinCopyWith(_Coin value, $Res Function(_Coin) _then) = __$CoinCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, String image, double currentPrice, double marketCap, int marketCapRank, double totalVolume, Sparkline sparkLineIn7d, double priceChangePercentage1hInCurrency, double priceChangePercentage24hInCurrency, double priceChangePercentage7dInCurrency, bool isFavorite
});


@override $SparklineCopyWith<$Res> get sparkLineIn7d;

}
/// @nodoc
class __$CoinCopyWithImpl<$Res>
    implements _$CoinCopyWith<$Res> {
  __$CoinCopyWithImpl(this._self, this._then);

  final _Coin _self;
  final $Res Function(_Coin) _then;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? currentPrice = null,Object? marketCap = null,Object? marketCapRank = null,Object? totalVolume = null,Object? sparkLineIn7d = null,Object? priceChangePercentage1hInCurrency = null,Object? priceChangePercentage24hInCurrency = null,Object? priceChangePercentage7dInCurrency = null,Object? isFavorite = null,}) {
  return _then(_Coin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double,sparkLineIn7d: null == sparkLineIn7d ? _self.sparkLineIn7d : sparkLineIn7d // ignore: cast_nullable_to_non_nullable
as Sparkline,priceChangePercentage1hInCurrency: null == priceChangePercentage1hInCurrency ? _self.priceChangePercentage1hInCurrency : priceChangePercentage1hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage24hInCurrency: null == priceChangePercentage24hInCurrency ? _self.priceChangePercentage24hInCurrency : priceChangePercentage24hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage7dInCurrency: null == priceChangePercentage7dInCurrency ? _self.priceChangePercentage7dInCurrency : priceChangePercentage7dInCurrency // ignore: cast_nullable_to_non_nullable
as double,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SparklineCopyWith<$Res> get sparkLineIn7d {
  
  return $SparklineCopyWith<$Res>(_self.sparkLineIn7d, (value) {
    return _then(_self.copyWith(sparkLineIn7d: value));
  });
}
}

// dart format on
