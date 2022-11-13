import 'package:cryptocurrency/domain/entities/coin_detail_entity.dart';
import 'package:equatable/equatable.dart';

class CoinDetailModel extends CoinDetailEntity with EquatableMixin {
  CoinDetailModel({
    required super.coinId,
    required super.name,
    required super.description,
    required super.symbol,
    required super.rank,
    required super.isActive,
  });

  factory CoinDetailModel.fromJson(Map<String, dynamic> json) =>
      CoinDetailModel(
        coinId: json['id'],
        name: json['name'],
        description: json['description'],
        symbol: json['symbol'],
        rank: json['rank'],
        isActive: json['is_active'],
      );
}
