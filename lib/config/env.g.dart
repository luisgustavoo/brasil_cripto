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
    3032710959,
    2347905401,
    44225723,
    2732348477,
    3852411947,
    2390214306,
    134826302,
    1670226311,
    2888463961,
    1163647890,
    3368687632,
    4159349864,
    165346283,
    1290467773,
    1689666968,
    2602576449,
    1394514603,
    3876075391,
    3605894600,
    1919635946,
    1490015027,
    2935736244,
    3926040306,
    4172717492,
    332311807,
    3495755581,
    4134138636,
  ];

  static const List<int> _envieddatacoingeckoApiKey = <int>[
    3032711020,
    2347905342,
    44225686,
    2732348527,
    3852412027,
    2390214384,
    134826340,
    1670226401,
    2888463915,
    1163647979,
    3368687736,
    4159349769,
    165346204,
    1290467824,
    1689667056,
    2602576499,
    1394514578,
    3876075305,
    3605894570,
    1919635878,
    1490015076,
    2935736289,
    3926040267,
    4172717507,
    332311688,
    3495755594,
    4134138703,
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
