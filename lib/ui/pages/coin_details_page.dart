import 'package:cryptocurrency/domain/usecases/get_coin_details.dart';
import 'package:cryptocurrency/ui/cubits/coin_detail/coin_detail_cubit.dart';
import 'package:cryptocurrency/ui/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class CoinDetailsPage extends StatelessWidget {
  final String coinId;

  const CoinDetailsPage({Key? key, required this.coinId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoinDetailCubit(getCoinDetails: sl<GetCoinDetails>(), coinId: coinId)
            ..coinDetailsRequested(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coin details'),
        ),
        body: BlocBuilder<CoinDetailCubit, CoinDetailState>(
          builder: (context, state) {
            if (state is CoinDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CoinDetailLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '${state.coin.rank}. ${state.coin.name} (${state.coin.symbol})',
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            state.coin.isActive ? 'active' : 'inactive',
                            style: TextStyle(
                                color: state.coin.isActive
                                    ? Colors.greenAccent
                                    : Colors.redAccent),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.coin.description,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is CoinDetailError) {
              return ErrorMessage(message: state.message);
            } else {
              return const ErrorMessage(message: 'Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
