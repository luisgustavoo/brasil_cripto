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
    2882413960,
    4247894194,
    4173068285,
    2308333767,
    427663600,
    3432720052,
    649626960,
    1883664837,
    838393842,
    435011961,
    1048323609,
    2263958017,
    1149612418,
    558394655,
    2684976433,
    487581461,
    1340604998,
    4042508373,
    681745628,
    1801961309,
    99604899,
    2035826863,
    4165979008,
    932560532,
    1271940944,
    4275253489,
    1482841203,
  ];

  static const List<int> _envieddatacoinGeckoApiKey = <int>[
    2882414027,
    4247894261,
    4173068240,
    2308333717,
    427663520,
    3432720102,
    649626890,
    1883664803,
    838393728,
    435011840,
    1048323697,
    2263958112,
    1149612533,
    558394706,
    2684976473,
    487581479,
    1340605055,
    4042508291,
    681745598,
    1801961233,
    99604980,
    2035826938,
    4165979065,
    932560611,
    1271940903,
    4275253382,
    1482841136,
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
