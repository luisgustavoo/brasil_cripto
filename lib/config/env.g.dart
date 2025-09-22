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
    2266939386,
    859343853,
    1409542380,
    1870358474,
    402614569,
    2136411204,
    2702795402,
    861866509,
    3600137486,
    2544780831,
    263283415,
    1335764364,
    141154009,
    2252918846,
    3952012324,
    2382870484,
    899253781,
    1567628330,
    1553744521,
    2781269676,
    2606194924,
    3171657442,
    2784594648,
    2054434644,
    728849234,
    955477172,
    1232423902,
  ];

  static const List<int> _envieddatacoinGeckoApiKey = <int>[
    2266939321,
    859343786,
    1409542337,
    1870358424,
    402614649,
    2136411158,
    2702795472,
    861866603,
    3600137596,
    2544780902,
    263283391,
    1335764461,
    141153966,
    2252918899,
    3952012364,
    2382870502,
    899253804,
    1567628412,
    1553744619,
    2781269728,
    2606194875,
    3171657399,
    2784594657,
    2054434595,
    728849189,
    955477187,
    1232423837,
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
