// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: .env
final class _Env {
  static const List<int> _enviedkeycoingeckoApiKey = <int>[
    1682473534,
    3739364261,
    3301469024,
    2900774630,
    2901533982,
    1935479632,
    2176607225,
    1434652232,
    1169210350,
    3527141775,
    2542820954,
    696104292,
    454386266,
    815257422,
    3101043252,
    3815176214,
    316563396,
    1389976768,
    1434014394,
    2005488724,
    2565205272,
    1801661022,
    4162397341,
    1557072291,
    653925661,
    449238205,
    1926215273,
  ];

  static const List<int> _envieddatacoingeckoApiKey = <int>[
    1682473597,
    3739364322,
    3301469005,
    2900774580,
    2901534030,
    1935479554,
    2176607139,
    1434652206,
    1169210268,
    3527141878,
    2542820914,
    696104197,
    454386221,
    815257347,
    3101043292,
    3815176228,
    316563453,
    1389976726,
    1434014424,
    2005488664,
    2565205327,
    1801660939,
    4162397348,
    1557072340,
    653925738,
    449238218,
    1926215210,
  ];

  static final String coingeckoApiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatacoingeckoApiKey.length,
      (int i) => i,
      growable: false,
    ).map(
      (int i) => _envieddatacoingeckoApiKey[i] ^ _enviedkeycoingeckoApiKey[i],
    ),
  );

  static const String baseUrl = 'https://api.coingecko.com/api/v3';
}
