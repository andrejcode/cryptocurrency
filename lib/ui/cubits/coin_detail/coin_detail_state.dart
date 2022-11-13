part of 'coin_detail_cubit.dart';

abstract class CoinDetailState extends Equatable {
  const CoinDetailState();

  @override
  List<Object> get props => [];
}

class CoinDetailLoading extends CoinDetailState {}

class CoinDetailLoaded extends CoinDetailState {
  final CoinDetailEntity coin;

  const CoinDetailLoaded({
    required this.coin,
  });

  @override
  List<Object> get props => [coin];
}

class CoinDetailError extends CoinDetailState {
  final String message;

  const CoinDetailError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
