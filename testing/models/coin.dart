import 'package:brasil_cripto/data/services/api/models/coins_markets_api_model.dart';
import 'package:brasil_cripto/domain/models/coin.dart';

import 'sparkline.dart';

final kCoin = Coin(
  id: 'bitcoin',
  symbol: 'btc',
  name: 'Bitcoin',
  image:
      'https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400',
  currentPrice: 114939,
  marketCap: 2289604075725,
  marketCapRank: 1,
  totalVolume: 50315182506,
  sparkLineIn7d: kSparkLine,
  priceChangePercentage1hInCurrency: -0.09244336875638641,
  priceChangePercentage24hInCurrency: 0.6435966697710743,
  priceChangePercentage7dInCurrency: 2.3870313659883893,
);

final kCoinsMarketsApiModel = CoinsMarketsApiModel(
  id: 'bitcoin',
  symbol: 'btc',
  name: 'Bitcoin',
  image:
      'https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400',
  currentPrice: 114939,
  marketCap: 2289604075725,
  marketCapRank: 1,
  fullyDilutedValuation: 2289604075725,
  totalVolume: 50315182506,
  high24h: 116309,
  low24h: 113496,
  priceChange24h: 735.02,
  priceChangePercentage24h: 0.6436,
  marketCapChange24h: 15475860897,
  marketCapChangePercentage24h: 0.68052,
  circulatingSupply: 19919859,
  totalSupply: 19919859,
  maxSupply: 21000000,
  ath: 124128,
  athChangePercentage: -7.41617,
  athDate: '2025-08-14T00:37:02.582Z',
  atl: 67.81,
  atlChangePercentage: 169379.70046,
  atlDate: '2013-07-06T00:00:00.000Z',
  lastUpdated: '2025-09-12T12:27:01.344Z',
  sparkLineIn7d: kSparkLineApiModel,
  priceChangePercentage1hInCurrency: -0.09244336875638641,
  priceChangePercentage24hInCurrency: 0.6435966697710743,
  priceChangePercentage7dInCurrency: 2.3870313659883893,
);
