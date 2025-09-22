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
    2946301040,
    3097433360,
    3739731620,
    1754076344,
    910566556,
    2230784683,
    3383753265,
    3872427315,
    577189424,
    1053795046,
    3623581021,
    1615612264,
    3546245013,
    1892636436,
    2680768420,
    1553286474,
    3494808615,
    1970367092,
    1748929167,
    1321928757,
    3755156806,
    1355524966,
    3461044128,
    2014262948,
    1941788216,
    4064461958,
    1516408257,
  ];

  static const List<int> _envieddatacoinGeckoApiKey = <int>[
    2946300979,
    3097433431,
    3739731593,
    1754076394,
    910566604,
    2230784761,
    3383753323,
    3872427349,
    577189442,
    1053794975,
    3623580981,
    1615612169,
    3546245090,
    1892636505,
    2680768460,
    1553286520,
    3494808606,
    1970367010,
    1748929261,
    1321928825,
    3755156753,
    1355524915,
    3461044121,
    2014262995,
    1941788239,
    4064462065,
    1516408194,
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
