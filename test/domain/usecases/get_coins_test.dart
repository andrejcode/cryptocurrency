import 'package:cryptocurrency/data/repositories/coin_repository_impl.dart';
import 'package:cryptocurrency/domain/entities/coin_entity.dart';
import 'package:cryptocurrency/domain/failures/failures.dart';
import 'package:cryptocurrency/domain/usecases/get_coins.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'get_coins_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CoinRepositoryImpl>()])
void main() {
  group('GetCoins', () {
    test('should return left with a ServerFailure', () async {
      final mockCoinRepositoryImpl = MockCoinRepositoryImpl();
      final getCoinsUseCaseUnderTest =
          GetCoins(coinRepository: mockCoinRepositoryImpl);

      when(mockCoinRepositoryImpl.getCoins())
          .thenAnswer((realInvocation) => Future.value(Left(ServerFailure())));

      final result = await getCoinsUseCaseUnderTest();
      expect(result.isLeft(), true);
      expect(result.isRight(), false);
      expect(result, Left<Failure, CoinEntity>(ServerFailure()));
      verify(mockCoinRepositoryImpl.getCoins()).called(1);
      verifyNoMoreInteractions(mockCoinRepositoryImpl);
    });
  });
}
