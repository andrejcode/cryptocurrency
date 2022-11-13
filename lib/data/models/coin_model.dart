import 'package:cryptocurrency/domain/entities/coin_entity.dart';
import 'package:equatable/equatable.dart';

class CoinModel extends CoinEntity with EquatableMixin {
  CoinModel({
    required super.id,
    required super.isActive,
    required super.name,
    required super.rank,
    required super.symbol,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json['id'],
        isActive: json['is_active'],
        name: json['name'],
        rank: json['rank'],
        symbol: json['symbol'],
      );
}
