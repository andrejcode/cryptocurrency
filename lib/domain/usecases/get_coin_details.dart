import 'package:cryptocurrency/domain/entities/coin_detail_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../repositories/coin_repository.dart';

class GetCoinDetails {
  final CoinRepository coinRepository;

  const GetCoinDetails({required this.coinRepository});

  Future<Either<Failure, CoinDetailEntity>> call() async {
    return coinRepository.getCoinDetails();
  }
}