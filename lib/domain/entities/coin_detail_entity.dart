import 'package:equatable/equatable.dart';

class CoinDetailEntity extends Equatable {
  final String coinId;
  final String name;
  final String description;
  final String symbol;
  final int rank;
  final bool isActive;
  // final List<String> tags;

  const CoinDetailEntity({
    required this.coinId,
    required this.name,
    required this.description,
    required this.symbol,
    required this.rank,
    required this.isActive,
    // required this.tags,
  });

  @override
  List<Object?> get props =>
      [coinId, name, description, symbol, rank, isActive];
}
