import 'package:cryptocurrency/domain/entities/coin_detail_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/coin_entity.dart';
import '../failures/failures.dart';

abstract class CoinRepository {
  Future<Either<Failure, List<CoinEntity>>> getCoins();
  Future<Either<Failure, CoinDetailEntity>> getCoinDetails();
}
