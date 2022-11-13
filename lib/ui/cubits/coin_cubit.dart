import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/coin_entity.dart';
import '../../domain/usecases/get_coins.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final GetCoins getCoins;

  CoinCubit({required this.getCoins}) : super(CoinLoading());

  void coinsRequested() async {
    emit(CoinLoading());
    final failureOrCoins = await getCoins();
    failureOrCoins.fold(
        (failure) =>
            emit(CoinError(message: 'Something went wrong. Please try again!')),
        (coins) => emit(CoinLoaded(coins: coins.toList())));
  }
}
