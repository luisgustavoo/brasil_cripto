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
    3939852231,
    3826035781,
    2804188787,
    229080651,
    2647938480,
    1240145239,
    3150540282,
    1191821017,
    1535249539,
    336536035,
    989072713,
    174476864,
    2188064983,
    2780126408,
    2059797076,
    867552304,
    1835231268,
    1662145948,
    3276978282,
    324802311,
    170553273,
    2176407848,
    1063660840,
    3322329644,
    474284796,
    2679165334,
    3881001441,
  ];

  static const List<int> _envieddatacoinGeckoApiKey = <int>[
    3939852164,
    3826035714,
    2804188766,
    229080601,
    2647938528,
    1240145157,
    3150540192,
    1191820991,
    1535249649,
    336535962,
    989072673,
    174476833,
    2188064928,
    2780126341,
    2059797052,
    867552258,
    1835231261,
    1662145994,
    3276978184,
    324802379,
    170553326,
    2176407933,
    1063660817,
    3322329691,
    474284683,
    2679165409,
    3881001378,
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
