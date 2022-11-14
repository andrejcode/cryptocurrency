import 'package:cryptocurrency/data/datasources/coin_remote_data_source.dart';
import 'package:cryptocurrency/data/exceptions/exceptions.dart';
import 'package:cryptocurrency/data/repositories/coin_repository_impl.dart';
import 'package:cryptocurrency/domain/entities/coin_entity.dart';
import 'package:cryptocurrency/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'coin_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CoinRemoteDataSourceImpl>()])
void main() {
  group('CoinRepositoryImpl', () {
    test(
        'should return left with a ServerFailure when a ServerException occurs',
        () async {
      final mockCoinRemoteDataSource = MockCoinRemoteDataSourceImpl();
      final coinRepositoryImplUnderTest =
          CoinRepositoryImpl(coinRemoteDataSource: mockCoinRemoteDataSource);

      when(mockCoinRemoteDataSource.getCoinsFromApi())
          .thenThrow(ServerException());

      final result = await coinRepositoryImplUnderTest.getCoins();
      expect(result.isLeft(), true);
      expect(result.isRight(), false);
      expect(result, Left<Failure, CoinEntity>(ServerFailure()));
    });
  });
}
