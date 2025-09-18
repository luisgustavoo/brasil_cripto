// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: .env
final class _Env {
  static const List<int> _enviedkeycoinGeckoApiKey = <int>[
    3943283635,
    558943552,
    2010321132,
    754915103,
    831393199,
    1202314835,
    2913432909,
    4138441480,
    2802936186,
    335865402,
    3887630914,
    921598816,
    1274621569,
    695305067,
    3594183933,
    3791744780,
    3654280438,
    3666702897,
    4249215321,
    2251411410,
    119283728,
    328076569,
    654484748,
    329936262,
    3615166419,
    222738932,
    3725787539,
  ];

  static const List<int> _envieddatacoinGeckoApiKey = <int>[
    3943283696,
    558943495,
    2010321089,
    754915149,
    831393279,
    1202314753,
    2913432855,
    4138441582,
    2802936072,
    335865411,
    3887630890,
    921598721,
    1274621686,
    695304998,
    3594183829,
    3791744830,
    3654280399,
    3666702951,
    4249215291,
    2251411358,
    119283783,
    328076620,
    654484789,
    329936369,
    3615166372,
    222738819,
    3725787600,
  ];

  static final String coinGeckoApiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatacoinGeckoApiKey.length,
      (int i) => i,
      growable: false,
    ).map(
      (int i) => _envieddatacoinGeckoApiKey[i] ^ _enviedkeycoinGeckoApiKey[i],
    ),
  );

  static const String baseUrl = 'https://api.coingecko.com/api/v3';
}
