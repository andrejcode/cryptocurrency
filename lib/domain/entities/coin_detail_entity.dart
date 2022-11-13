import 'package:equatable/equatable.dart';

class CoinDetailEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String symbol;
  final int rank;
  final bool isActive;

  const CoinDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.symbol,
    required this.rank,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        symbol,
        rank,
        isActive,
      ];
}
