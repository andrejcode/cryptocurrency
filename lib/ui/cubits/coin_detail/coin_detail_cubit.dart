import 'package:bloc/bloc.dart';
import 'package:cryptocurrency/domain/entities/coin_detail_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_coin_details.dart';

part 'coin_detail_state.dart';

class CoinDetailCubit extends Cubit<CoinDetailState> {
  final GetCoinDetails getCoinDetails;
  final String coinId;
  CoinDetailCubit({required this.getCoinDetails, required this.coinId}) : super(CoinDetailLoading());

  void coinDetailsRequested() async {
    emit(CoinDetailLoading());
    final failureOrAdvice = await getCoinDetails(coinId: coinId);
    failureOrAdvice.fold(
          (failure) => emit(CoinDetailError(message: 'Error')),
          (coinDetails) => emit(CoinDetailLoaded(coin: coinDetails)),
    );
  }
}
