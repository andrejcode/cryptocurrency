import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final String id;
  final bool isActive;
  final String name;
  final int rank;
  final String symbol;

  const CoinEntity({
    required this.id,
    required this.isActive,
    required this.name,
    required this.rank,
    required this.symbol,
  });

  @override
  List<Object?> get props => [id, isActive, name, rank, symbol];
}
