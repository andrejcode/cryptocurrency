import 'package:cryptocurrency/domain/usecases/get_coins.dart';
import 'package:cryptocurrency/ui/cubits/coin/coin_cubit.dart';
import 'package:cryptocurrency/ui/pages/coin_details_page.dart';
import 'package:cryptocurrency/ui/widgets/coin_list_item.dart';
import 'package:cryptocurrency/ui/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CoinCubit>()..coinsRequested(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coins'),
        ),
        body: BlocBuilder<CoinCubit, CoinState>(
          builder: ((context, state) {
            if (state is CoinLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CoinLoaded) {
              return ListView.builder(
                itemCount: state.coins.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoinDetailsPage(
                                  coinId: state.coins[index].id)));
                    },
                    child: CoinListItem(coin: state.coins[index]),
                  );
                },
              );
            } else if (state is CoinError) {
              return ErrorMessage(message: state.message);
            } else {
              return const ErrorMessage(
                message: 'Something went wrong.',
              );
            }
          }),
        ),
      ),
    );
  }
}
