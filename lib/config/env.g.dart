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
    4038073596,
    3684351078,
    3322952498,
    3220999586,
    301103936,
    3398100707,
    3828762919,
    164330619,
    2826111152,
    254524136,
    3870004765,
    2659223574,
    1066698200,
    3977204706,
    180143576,
    129860778,
    36651648,
    1557849581,
    1554322749,
    804194726,
    3659943012,
    2353736247,
    43104237,
    2557442020,
    1717363020,
    2557654054,
    129267402,
  ];

  static const List<int> _envieddatacoingeckoApiKey = <int>[
    4038073535,
    3684351009,
    3322952479,
    3220999664,
    301103888,
    3398100657,
    3828763005,
    164330525,
    2826111170,
    254524049,
    3870004853,
    2659223671,
    1066698159,
    3977204655,
    180143536,
    129860760,
    36651705,
    1557849531,
    1554322783,
    804194794,
    3659942963,
    2353736290,
    43104212,
    2557441939,
    1717363003,
    2557654097,
    129267337,
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
