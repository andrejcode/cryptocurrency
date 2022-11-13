part of 'coin_cubit.dart';

@immutable
abstract class CoinState extends Equatable {
  @override
  List<Object> get props => [];
}

class CoinLoading extends CoinState {}

class CoinLoaded extends CoinState {
  final List<CoinEntity> coins;

  CoinLoaded({
    required this.coins
  });

  @override
  List<Object> get props => [coins];
}

class CoinError extends CoinState {
  final String message;

  CoinError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
