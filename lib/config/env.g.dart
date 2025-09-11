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
    2793266125,
    3875056090,
    3435893186,
    4063860766,
    2561548663,
    4282622994,
    287559781,
    2847905253,
    1017994100,
    3063452999,
    1975690550,
    4176599441,
    2426196654,
    1127358055,
    3408038878,
    3681639779,
    1057338264,
    3754450292,
    3210079637,
    60070793,
    3695892764,
    742307951,
    3747947691,
    1121913153,
    2035466434,
    3511136944,
    1114409629,
  ];

  static const List<int> _envieddatacoingeckoApiKey = <int>[
    2793266062,
    3875056029,
    3435893231,
    4063860812,
    2561548583,
    4282623040,
    287559743,
    2847905155,
    1017993990,
    3063452990,
    1975690590,
    4176599536,
    2426196697,
    1127357994,
    3408038838,
    3681639761,
    1057338273,
    3754450210,
    3210079735,
    60070853,
    3695892811,
    742307898,
    3747947666,
    1121913142,
    2035466421,
    3511136967,
    1114409694,
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
