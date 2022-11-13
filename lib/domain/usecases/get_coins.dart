import 'package:cryptocurrency/domain/entities/coin_entity.dart';
import 'package:cryptocurrency/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

class GetCoins {
  final CoinRepository coinRepository;

  const GetCoins({required this.coinRepository});

  Future<Either<Failure, List<CoinEntity>>> call() async {
    return coinRepository.getCoins();
  }
}
