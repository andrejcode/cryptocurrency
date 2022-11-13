import 'dart:convert';
import 'package:cryptocurrency/data/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import '../models/coin_detail_model.dart';
import '../models/coin_model.dart';

abstract class CoinRemoteDataSource {
  Future<List<CoinModel>> getCoinsFromApi();

  Future<CoinDetailModel> getCoinDetailFromApi();
}

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  const CoinRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CoinModel>> getCoinsFromApi() async {
    final response =
        await client.get(Uri.parse('https://api.coinpaprika.com/v1/coins/'));

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final List responseBody = jsonDecode(response.body);
      return (responseBody).map((e) => CoinModel.fromJson(e)).toList();
    }
  }

  @override
  Future<CoinDetailModel> getCoinDetailFromApi() async {
    final response = await client
        .get(Uri.parse('https://api.coinpaprika.com/v1/coins/btc-bitcoin'));

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = jsonDecode(response.body);
      return CoinDetailModel.fromJson(responseBody);
    }
  }
}
