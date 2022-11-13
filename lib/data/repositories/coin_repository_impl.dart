import 'package:cryptocurrency/data/datasources/coin_remote_data_source.dart';
import 'package:cryptocurrency/data/exceptions/exceptions.dart';
import 'package:cryptocurrency/domain/entities/coin_detail_entity.dart';
import 'package:cryptocurrency/domain/entities/coin_entity.dart';
import 'package:cryptocurrency/domain/failures/failures.dart';
import 'package:cryptocurrency/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource coinRemoteDataSource;

  const CoinRepositoryImpl({
    required this.coinRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CoinEntity>>> getCoins() async {
    try {
      final result = await coinRemoteDataSource.getCoinsFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, CoinDetailEntity>> getCoinDetailFromDataSource({required String coinId}) async {
    try {
      final result = await coinRemoteDataSource.getCoinDetailFromApi(coinId: coinId);
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      // Handle the exception
      return left(GeneralFailure());
    }
  }
}
