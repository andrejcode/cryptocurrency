import 'package:cryptocurrency/domain/entities/coin_detail_entity.dart';
import 'package:equatable/equatable.dart';

class CoinDetailModel extends CoinDetailEntity with EquatableMixin {
  CoinDetailModel(
      {required String id,
      required String name,
      required String description,
      required String symbol,
      required int rank,
      required bool isActive})
      : super(
          id: id,
          name: name,
          description: description,
          symbol: symbol,
          rank: rank,
          isActive: isActive,
        );

  factory CoinDetailModel.fromJson(Map<String, dynamic> json) {
    return CoinDetailModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      symbol: json['symbol'],
      rank: json['rank'],
      isActive: json['is_active'],
    );
  }
}
