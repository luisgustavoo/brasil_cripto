// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coins_markets_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinsMarketsApiModel {

 String get id; String get symbol; String get name; String get image; double get currentPrice; double get marketCap; int get marketCapRank;@JsonKey(name: 'sparkline_in_7d') SparkLineApiModel get sparkLineIn7d;@JsonKey(name: 'price_change_percentage_1h_in_currency') double get priceChangePercentage1hInCurrency;@JsonKey(name: 'price_change_percentage_24h_in_currency') double get priceChangePercentage24hInCurrency;@JsonKey(name: 'price_change_percentage_7d_in_currency') double get priceChangePercentage7dInCurrency; double get totalVolume; double? get fullyDilutedValuation; double? get high24h; double? get low24h; double? get priceChange24h; double? get priceChangePercentage24h; double? get marketCapChange24h; double? get marketCapChangePercentage24h; double? get circulatingSupply; double? get totalSupply; double? get maxSupply; double? get ath; double? get athChangePercentage; String? get athDate; double? get atl; double? get atlChangePercentage; String? get atlDate; dynamic get roi; String? get lastUpdated;
/// Create a copy of CoinsMarketsApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinsMarketsApiModelCopyWith<CoinsMarketsApiModel> get copyWith => _$CoinsMarketsApiModelCopyWithImpl<CoinsMarketsApiModel>(this as CoinsMarketsApiModel, _$identity);

  /// Serializes this CoinsMarketsApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinsMarketsApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.sparkLineIn7d, sparkLineIn7d) || other.sparkLineIn7d == sparkLineIn7d)&&(identical(other.priceChangePercentage1hInCurrency, priceChangePercentage1hInCurrency) || other.priceChangePercentage1hInCurrency == priceChangePercentage1hInCurrency)&&(identical(other.priceChangePercentage24hInCurrency, priceChangePercentage24hInCurrency) || other.priceChangePercentage24hInCurrency == priceChangePercentage24hInCurrency)&&(identical(other.priceChangePercentage7dInCurrency, priceChangePercentage7dInCurrency) || other.priceChangePercentage7dInCurrency == priceChangePercentage7dInCurrency)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.fullyDilutedValuation, fullyDilutedValuation) || other.fullyDilutedValuation == fullyDilutedValuation)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.marketCapChange24h, marketCapChange24h) || other.marketCapChange24h == marketCapChange24h)&&(identical(other.marketCapChangePercentage24h, marketCapChangePercentage24h) || other.marketCapChangePercentage24h == marketCapChangePercentage24h)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.ath, ath) || other.ath == ath)&&(identical(other.athChangePercentage, athChangePercentage) || other.athChangePercentage == athChangePercentage)&&(identical(other.athDate, athDate) || other.athDate == athDate)&&(identical(other.atl, atl) || other.atl == atl)&&(identical(other.atlChangePercentage, atlChangePercentage) || other.atlChangePercentage == atlChangePercentage)&&(identical(other.atlDate, atlDate) || other.atlDate == atlDate)&&const DeepCollectionEquality().equals(other.roi, roi)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,symbol,name,image,currentPrice,marketCap,marketCapRank,sparkLineIn7d,priceChangePercentage1hInCurrency,priceChangePercentage24hInCurrency,priceChangePercentage7dInCurrency,totalVolume,fullyDilutedValuation,high24h,low24h,priceChange24h,priceChangePercentage24h,marketCapChange24h,marketCapChangePercentage24h,circulatingSupply,totalSupply,maxSupply,ath,athChangePercentage,athDate,atl,atlChangePercentage,atlDate,const DeepCollectionEquality().hash(roi),lastUpdated]);

@override
String toString() {
  return 'CoinsMarketsApiModel(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, sparkLineIn7d: $sparkLineIn7d, priceChangePercentage1hInCurrency: $priceChangePercentage1hInCurrency, priceChangePercentage24hInCurrency: $priceChangePercentage24hInCurrency, priceChangePercentage7dInCurrency: $priceChangePercentage7dInCurrency, totalVolume: $totalVolume, fullyDilutedValuation: $fullyDilutedValuation, high24h: $high24h, low24h: $low24h, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, marketCapChange24h: $marketCapChange24h, marketCapChangePercentage24h: $marketCapChangePercentage24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, ath: $ath, athChangePercentage: $athChangePercentage, athDate: $athDate, atl: $atl, atlChangePercentage: $atlChangePercentage, atlDate: $atlDate, roi: $roi, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $CoinsMarketsApiModelCopyWith<$Res>  {
  factory $CoinsMarketsApiModelCopyWith(CoinsMarketsApiModel value, $Res Function(CoinsMarketsApiModel) _then) = _$CoinsMarketsApiModelCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, String image, double currentPrice, double marketCap, int marketCapRank,@JsonKey(name: 'sparkline_in_7d') SparkLineApiModel sparkLineIn7d,@JsonKey(name: 'price_change_percentage_1h_in_currency') double priceChangePercentage1hInCurrency,@JsonKey(name: 'price_change_percentage_24h_in_currency') double priceChangePercentage24hInCurrency,@JsonKey(name: 'price_change_percentage_7d_in_currency') double priceChangePercentage7dInCurrency, double totalVolume, double? fullyDilutedValuation, double? high24h, double? low24h, double? priceChange24h, double? priceChangePercentage24h, double? marketCapChange24h, double? marketCapChangePercentage24h, double? circulatingSupply, double? totalSupply, double? maxSupply, double? ath, double? athChangePercentage, String? athDate, double? atl, double? atlChangePercentage, String? atlDate, dynamic roi, String? lastUpdated
});


$SparkLineApiModelCopyWith<$Res> get sparkLineIn7d;

}
/// @nodoc
class _$CoinsMarketsApiModelCopyWithImpl<$Res>
    implements $CoinsMarketsApiModelCopyWith<$Res> {
  _$CoinsMarketsApiModelCopyWithImpl(this._self, this._then);

  final CoinsMarketsApiModel _self;
  final $Res Function(CoinsMarketsApiModel) _then;

/// Create a copy of CoinsMarketsApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? currentPrice = null,Object? marketCap = null,Object? marketCapRank = null,Object? sparkLineIn7d = null,Object? priceChangePercentage1hInCurrency = null,Object? priceChangePercentage24hInCurrency = null,Object? priceChangePercentage7dInCurrency = null,Object? totalVolume = null,Object? fullyDilutedValuation = freezed,Object? high24h = freezed,Object? low24h = freezed,Object? priceChange24h = freezed,Object? priceChangePercentage24h = freezed,Object? marketCapChange24h = freezed,Object? marketCapChangePercentage24h = freezed,Object? circulatingSupply = freezed,Object? totalSupply = freezed,Object? maxSupply = freezed,Object? ath = freezed,Object? athChangePercentage = freezed,Object? athDate = freezed,Object? atl = freezed,Object? atlChangePercentage = freezed,Object? atlDate = freezed,Object? roi = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,sparkLineIn7d: null == sparkLineIn7d ? _self.sparkLineIn7d : sparkLineIn7d // ignore: cast_nullable_to_non_nullable
as SparkLineApiModel,priceChangePercentage1hInCurrency: null == priceChangePercentage1hInCurrency ? _self.priceChangePercentage1hInCurrency : priceChangePercentage1hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage24hInCurrency: null == priceChangePercentage24hInCurrency ? _self.priceChangePercentage24hInCurrency : priceChangePercentage24hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage7dInCurrency: null == priceChangePercentage7dInCurrency ? _self.priceChangePercentage7dInCurrency : priceChangePercentage7dInCurrency // ignore: cast_nullable_to_non_nullable
as double,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double,fullyDilutedValuation: freezed == fullyDilutedValuation ? _self.fullyDilutedValuation : fullyDilutedValuation // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage24h: freezed == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,marketCapChange24h: freezed == marketCapChange24h ? _self.marketCapChange24h : marketCapChange24h // ignore: cast_nullable_to_non_nullable
as double?,marketCapChangePercentage24h: freezed == marketCapChangePercentage24h ? _self.marketCapChangePercentage24h : marketCapChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,circulatingSupply: freezed == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as double?,totalSupply: freezed == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as double?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as double?,ath: freezed == ath ? _self.ath : ath // ignore: cast_nullable_to_non_nullable
as double?,athChangePercentage: freezed == athChangePercentage ? _self.athChangePercentage : athChangePercentage // ignore: cast_nullable_to_non_nullable
as double?,athDate: freezed == athDate ? _self.athDate : athDate // ignore: cast_nullable_to_non_nullable
as String?,atl: freezed == atl ? _self.atl : atl // ignore: cast_nullable_to_non_nullable
as double?,atlChangePercentage: freezed == atlChangePercentage ? _self.atlChangePercentage : atlChangePercentage // ignore: cast_nullable_to_non_nullable
as double?,atlDate: freezed == atlDate ? _self.atlDate : atlDate // ignore: cast_nullable_to_non_nullable
as String?,roi: freezed == roi ? _self.roi : roi // ignore: cast_nullable_to_non_nullable
as dynamic,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CoinsMarketsApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SparkLineApiModelCopyWith<$Res> get sparkLineIn7d {
  
  return $SparkLineApiModelCopyWith<$Res>(_self.sparkLineIn7d, (value) {
    return _then(_self.copyWith(sparkLineIn7d: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoinsMarketsApiModel].
extension CoinsMarketsApiModelPatterns on CoinsMarketsApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinsMarketsApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinsMarketsApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinsMarketsApiModel value)  $default,){
final _that = this;
switch (_that) {
case _CoinsMarketsApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinsMarketsApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoinsMarketsApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String image,  double currentPrice,  double marketCap,  int marketCapRank, @JsonKey(name: 'sparkline_in_7d')  SparkLineApiModel sparkLineIn7d, @JsonKey(name: 'price_change_percentage_1h_in_currency')  double priceChangePercentage1hInCurrency, @JsonKey(name: 'price_change_percentage_24h_in_currency')  double priceChangePercentage24hInCurrency, @JsonKey(name: 'price_change_percentage_7d_in_currency')  double priceChangePercentage7dInCurrency,  double totalVolume,  double? fullyDilutedValuation,  double? high24h,  double? low24h,  double? priceChange24h,  double? priceChangePercentage24h,  double? marketCapChange24h,  double? marketCapChangePercentage24h,  double? circulatingSupply,  double? totalSupply,  double? maxSupply,  double? ath,  double? athChangePercentage,  String? athDate,  double? atl,  double? atlChangePercentage,  String? atlDate,  dynamic roi,  String? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinsMarketsApiModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.sparkLineIn7d,_that.priceChangePercentage1hInCurrency,_that.priceChangePercentage24hInCurrency,_that.priceChangePercentage7dInCurrency,_that.totalVolume,_that.fullyDilutedValuation,_that.high24h,_that.low24h,_that.priceChange24h,_that.priceChangePercentage24h,_that.marketCapChange24h,_that.marketCapChangePercentage24h,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.ath,_that.athChangePercentage,_that.athDate,_that.atl,_that.atlChangePercentage,_that.atlDate,_that.roi,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String image,  double currentPrice,  double marketCap,  int marketCapRank, @JsonKey(name: 'sparkline_in_7d')  SparkLineApiModel sparkLineIn7d, @JsonKey(name: 'price_change_percentage_1h_in_currency')  double priceChangePercentage1hInCurrency, @JsonKey(name: 'price_change_percentage_24h_in_currency')  double priceChangePercentage24hInCurrency, @JsonKey(name: 'price_change_percentage_7d_in_currency')  double priceChangePercentage7dInCurrency,  double totalVolume,  double? fullyDilutedValuation,  double? high24h,  double? low24h,  double? priceChange24h,  double? priceChangePercentage24h,  double? marketCapChange24h,  double? marketCapChangePercentage24h,  double? circulatingSupply,  double? totalSupply,  double? maxSupply,  double? ath,  double? athChangePercentage,  String? athDate,  double? atl,  double? atlChangePercentage,  String? atlDate,  dynamic roi,  String? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _CoinsMarketsApiModel():
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.sparkLineIn7d,_that.priceChangePercentage1hInCurrency,_that.priceChangePercentage24hInCurrency,_that.priceChangePercentage7dInCurrency,_that.totalVolume,_that.fullyDilutedValuation,_that.high24h,_that.low24h,_that.priceChange24h,_that.priceChangePercentage24h,_that.marketCapChange24h,_that.marketCapChangePercentage24h,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.ath,_that.athChangePercentage,_that.athDate,_that.atl,_that.atlChangePercentage,_that.atlDate,_that.roi,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  String image,  double currentPrice,  double marketCap,  int marketCapRank, @JsonKey(name: 'sparkline_in_7d')  SparkLineApiModel sparkLineIn7d, @JsonKey(name: 'price_change_percentage_1h_in_currency')  double priceChangePercentage1hInCurrency, @JsonKey(name: 'price_change_percentage_24h_in_currency')  double priceChangePercentage24hInCurrency, @JsonKey(name: 'price_change_percentage_7d_in_currency')  double priceChangePercentage7dInCurrency,  double totalVolume,  double? fullyDilutedValuation,  double? high24h,  double? low24h,  double? priceChange24h,  double? priceChangePercentage24h,  double? marketCapChange24h,  double? marketCapChangePercentage24h,  double? circulatingSupply,  double? totalSupply,  double? maxSupply,  double? ath,  double? athChangePercentage,  String? athDate,  double? atl,  double? atlChangePercentage,  String? atlDate,  dynamic roi,  String? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _CoinsMarketsApiModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.currentPrice,_that.marketCap,_that.marketCapRank,_that.sparkLineIn7d,_that.priceChangePercentage1hInCurrency,_that.priceChangePercentage24hInCurrency,_that.priceChangePercentage7dInCurrency,_that.totalVolume,_that.fullyDilutedValuation,_that.high24h,_that.low24h,_that.priceChange24h,_that.priceChangePercentage24h,_that.marketCapChange24h,_that.marketCapChangePercentage24h,_that.circulatingSupply,_that.totalSupply,_that.maxSupply,_that.ath,_that.athChangePercentage,_that.athDate,_that.atl,_that.atlChangePercentage,_that.atlDate,_that.roi,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinsMarketsApiModel implements CoinsMarketsApiModel {
  const _CoinsMarketsApiModel({required this.id, required this.symbol, required this.name, required this.image, required this.currentPrice, required this.marketCap, required this.marketCapRank, @JsonKey(name: 'sparkline_in_7d') required this.sparkLineIn7d, @JsonKey(name: 'price_change_percentage_1h_in_currency') required this.priceChangePercentage1hInCurrency, @JsonKey(name: 'price_change_percentage_24h_in_currency') required this.priceChangePercentage24hInCurrency, @JsonKey(name: 'price_change_percentage_7d_in_currency') required this.priceChangePercentage7dInCurrency, required this.totalVolume, this.fullyDilutedValuation, this.high24h, this.low24h, this.priceChange24h, this.priceChangePercentage24h, this.marketCapChange24h, this.marketCapChangePercentage24h, this.circulatingSupply, this.totalSupply, this.maxSupply, this.ath, this.athChangePercentage, this.athDate, this.atl, this.atlChangePercentage, this.atlDate, this.roi, this.lastUpdated});
  factory _CoinsMarketsApiModel.fromJson(Map<String, dynamic> json) => _$CoinsMarketsApiModelFromJson(json);

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  String image;
@override final  double currentPrice;
@override final  double marketCap;
@override final  int marketCapRank;
@override@JsonKey(name: 'sparkline_in_7d') final  SparkLineApiModel sparkLineIn7d;
@override@JsonKey(name: 'price_change_percentage_1h_in_currency') final  double priceChangePercentage1hInCurrency;
@override@JsonKey(name: 'price_change_percentage_24h_in_currency') final  double priceChangePercentage24hInCurrency;
@override@JsonKey(name: 'price_change_percentage_7d_in_currency') final  double priceChangePercentage7dInCurrency;
@override final  double totalVolume;
@override final  double? fullyDilutedValuation;
@override final  double? high24h;
@override final  double? low24h;
@override final  double? priceChange24h;
@override final  double? priceChangePercentage24h;
@override final  double? marketCapChange24h;
@override final  double? marketCapChangePercentage24h;
@override final  double? circulatingSupply;
@override final  double? totalSupply;
@override final  double? maxSupply;
@override final  double? ath;
@override final  double? athChangePercentage;
@override final  String? athDate;
@override final  double? atl;
@override final  double? atlChangePercentage;
@override final  String? atlDate;
@override final  dynamic roi;
@override final  String? lastUpdated;

/// Create a copy of CoinsMarketsApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinsMarketsApiModelCopyWith<_CoinsMarketsApiModel> get copyWith => __$CoinsMarketsApiModelCopyWithImpl<_CoinsMarketsApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinsMarketsApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinsMarketsApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.sparkLineIn7d, sparkLineIn7d) || other.sparkLineIn7d == sparkLineIn7d)&&(identical(other.priceChangePercentage1hInCurrency, priceChangePercentage1hInCurrency) || other.priceChangePercentage1hInCurrency == priceChangePercentage1hInCurrency)&&(identical(other.priceChangePercentage24hInCurrency, priceChangePercentage24hInCurrency) || other.priceChangePercentage24hInCurrency == priceChangePercentage24hInCurrency)&&(identical(other.priceChangePercentage7dInCurrency, priceChangePercentage7dInCurrency) || other.priceChangePercentage7dInCurrency == priceChangePercentage7dInCurrency)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.fullyDilutedValuation, fullyDilutedValuation) || other.fullyDilutedValuation == fullyDilutedValuation)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h)&&(identical(other.priceChangePercentage24h, priceChangePercentage24h) || other.priceChangePercentage24h == priceChangePercentage24h)&&(identical(other.marketCapChange24h, marketCapChange24h) || other.marketCapChange24h == marketCapChange24h)&&(identical(other.marketCapChangePercentage24h, marketCapChangePercentage24h) || other.marketCapChangePercentage24h == marketCapChangePercentage24h)&&(identical(other.circulatingSupply, circulatingSupply) || other.circulatingSupply == circulatingSupply)&&(identical(other.totalSupply, totalSupply) || other.totalSupply == totalSupply)&&(identical(other.maxSupply, maxSupply) || other.maxSupply == maxSupply)&&(identical(other.ath, ath) || other.ath == ath)&&(identical(other.athChangePercentage, athChangePercentage) || other.athChangePercentage == athChangePercentage)&&(identical(other.athDate, athDate) || other.athDate == athDate)&&(identical(other.atl, atl) || other.atl == atl)&&(identical(other.atlChangePercentage, atlChangePercentage) || other.atlChangePercentage == atlChangePercentage)&&(identical(other.atlDate, atlDate) || other.atlDate == atlDate)&&const DeepCollectionEquality().equals(other.roi, roi)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,symbol,name,image,currentPrice,marketCap,marketCapRank,sparkLineIn7d,priceChangePercentage1hInCurrency,priceChangePercentage24hInCurrency,priceChangePercentage7dInCurrency,totalVolume,fullyDilutedValuation,high24h,low24h,priceChange24h,priceChangePercentage24h,marketCapChange24h,marketCapChangePercentage24h,circulatingSupply,totalSupply,maxSupply,ath,athChangePercentage,athDate,atl,atlChangePercentage,atlDate,const DeepCollectionEquality().hash(roi),lastUpdated]);

@override
String toString() {
  return 'CoinsMarketsApiModel(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, sparkLineIn7d: $sparkLineIn7d, priceChangePercentage1hInCurrency: $priceChangePercentage1hInCurrency, priceChangePercentage24hInCurrency: $priceChangePercentage24hInCurrency, priceChangePercentage7dInCurrency: $priceChangePercentage7dInCurrency, totalVolume: $totalVolume, fullyDilutedValuation: $fullyDilutedValuation, high24h: $high24h, low24h: $low24h, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, marketCapChange24h: $marketCapChange24h, marketCapChangePercentage24h: $marketCapChangePercentage24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, ath: $ath, athChangePercentage: $athChangePercentage, athDate: $athDate, atl: $atl, atlChangePercentage: $atlChangePercentage, atlDate: $atlDate, roi: $roi, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$CoinsMarketsApiModelCopyWith<$Res> implements $CoinsMarketsApiModelCopyWith<$Res> {
  factory _$CoinsMarketsApiModelCopyWith(_CoinsMarketsApiModel value, $Res Function(_CoinsMarketsApiModel) _then) = __$CoinsMarketsApiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, String image, double currentPrice, double marketCap, int marketCapRank,@JsonKey(name: 'sparkline_in_7d') SparkLineApiModel sparkLineIn7d,@JsonKey(name: 'price_change_percentage_1h_in_currency') double priceChangePercentage1hInCurrency,@JsonKey(name: 'price_change_percentage_24h_in_currency') double priceChangePercentage24hInCurrency,@JsonKey(name: 'price_change_percentage_7d_in_currency') double priceChangePercentage7dInCurrency, double totalVolume, double? fullyDilutedValuation, double? high24h, double? low24h, double? priceChange24h, double? priceChangePercentage24h, double? marketCapChange24h, double? marketCapChangePercentage24h, double? circulatingSupply, double? totalSupply, double? maxSupply, double? ath, double? athChangePercentage, String? athDate, double? atl, double? atlChangePercentage, String? atlDate, dynamic roi, String? lastUpdated
});


@override $SparkLineApiModelCopyWith<$Res> get sparkLineIn7d;

}
/// @nodoc
class __$CoinsMarketsApiModelCopyWithImpl<$Res>
    implements _$CoinsMarketsApiModelCopyWith<$Res> {
  __$CoinsMarketsApiModelCopyWithImpl(this._self, this._then);

  final _CoinsMarketsApiModel _self;
  final $Res Function(_CoinsMarketsApiModel) _then;

/// Create a copy of CoinsMarketsApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? currentPrice = null,Object? marketCap = null,Object? marketCapRank = null,Object? sparkLineIn7d = null,Object? priceChangePercentage1hInCurrency = null,Object? priceChangePercentage24hInCurrency = null,Object? priceChangePercentage7dInCurrency = null,Object? totalVolume = null,Object? fullyDilutedValuation = freezed,Object? high24h = freezed,Object? low24h = freezed,Object? priceChange24h = freezed,Object? priceChangePercentage24h = freezed,Object? marketCapChange24h = freezed,Object? marketCapChangePercentage24h = freezed,Object? circulatingSupply = freezed,Object? totalSupply = freezed,Object? maxSupply = freezed,Object? ath = freezed,Object? athChangePercentage = freezed,Object? athDate = freezed,Object? atl = freezed,Object? atlChangePercentage = freezed,Object? atlDate = freezed,Object? roi = freezed,Object? lastUpdated = freezed,}) {
  return _then(_CoinsMarketsApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as double,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,sparkLineIn7d: null == sparkLineIn7d ? _self.sparkLineIn7d : sparkLineIn7d // ignore: cast_nullable_to_non_nullable
as SparkLineApiModel,priceChangePercentage1hInCurrency: null == priceChangePercentage1hInCurrency ? _self.priceChangePercentage1hInCurrency : priceChangePercentage1hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage24hInCurrency: null == priceChangePercentage24hInCurrency ? _self.priceChangePercentage24hInCurrency : priceChangePercentage24hInCurrency // ignore: cast_nullable_to_non_nullable
as double,priceChangePercentage7dInCurrency: null == priceChangePercentage7dInCurrency ? _self.priceChangePercentage7dInCurrency : priceChangePercentage7dInCurrency // ignore: cast_nullable_to_non_nullable
as double,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double,fullyDilutedValuation: freezed == fullyDilutedValuation ? _self.fullyDilutedValuation : fullyDilutedValuation // ignore: cast_nullable_to_non_nullable
as double?,high24h: freezed == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double?,low24h: freezed == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,priceChangePercentage24h: freezed == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,marketCapChange24h: freezed == marketCapChange24h ? _self.marketCapChange24h : marketCapChange24h // ignore: cast_nullable_to_non_nullable
as double?,marketCapChangePercentage24h: freezed == marketCapChangePercentage24h ? _self.marketCapChangePercentage24h : marketCapChangePercentage24h // ignore: cast_nullable_to_non_nullable
as double?,circulatingSupply: freezed == circulatingSupply ? _self.circulatingSupply : circulatingSupply // ignore: cast_nullable_to_non_nullable
as double?,totalSupply: freezed == totalSupply ? _self.totalSupply : totalSupply // ignore: cast_nullable_to_non_nullable
as double?,maxSupply: freezed == maxSupply ? _self.maxSupply : maxSupply // ignore: cast_nullable_to_non_nullable
as double?,ath: freezed == ath ? _self.ath : ath // ignore: cast_nullable_to_non_nullable
as double?,athChangePercentage: freezed == athChangePercentage ? _self.athChangePercentage : athChangePercentage // ignore: cast_nullable_to_non_nullable
as double?,athDate: freezed == athDate ? _self.athDate : athDate // ignore: cast_nullable_to_non_nullable
as String?,atl: freezed == atl ? _self.atl : atl // ignore: cast_nullable_to_non_nullable
as double?,atlChangePercentage: freezed == atlChangePercentage ? _self.atlChangePercentage : atlChangePercentage // ignore: cast_nullable_to_non_nullable
as double?,atlDate: freezed == atlDate ? _self.atlDate : atlDate // ignore: cast_nullable_to_non_nullable
as String?,roi: freezed == roi ? _self.roi : roi // ignore: cast_nullable_to_non_nullable
as dynamic,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CoinsMarketsApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SparkLineApiModelCopyWith<$Res> get sparkLineIn7d {
  
  return $SparkLineApiModelCopyWith<$Res>(_self.sparkLineIn7d, (value) {
    return _then(_self.copyWith(sparkLineIn7d: value));
  });
}
}

// dart format on
