import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  ApiClient({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;

  Future<Result<List<CoinsMarketsModel>>> fetchCoinsMarkets() async {
    try {
      final result = await _httpClient.auth().get<List<dynamic>>(
        '/coins/markets',
        queryParameters: {
          'vs_currency': 'brl',
          'order': 'market_cap_desc',
          // 'per_page': '100',
          // 'page': '1',
          'sparkline': true,
          'price_change_percentage': '1h,24h,7d',
          'names': 'bitcoin',
          // 'names': 'bitcoin,ethereum,binancecoin,ripple,cardano,dogecoin,polkadot,solana,tron,litecoin,uniswap,chainlink,wrapped-bitcoin,stellar,bitcoin-cash,vechain,filecoin,theta-network,eos,monero,aave,tezos,cosmos,iota,fantom,kusama,elrond-erd-2,nem,zcash,decred,celo,harmony,maker,sushi,compound-governance-token,enjincoin,basic-attention-token',
        },
      );

      switch (result) {
        case Ok():
          final data = result.value.data;
          if (data?.isNotEmpty ?? false) {
            final coinsMarketsList = List<Map<String, dynamic>>.from(data!);
            final coinsMarkets = coinsMarketsList
                .map(CoinsMarketsModel.fromJson)
                .toList();
            return Result.ok(coinsMarkets);
          } else {
            return const Result.ok(<CoinsMarketsModel>[]);
          }
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
