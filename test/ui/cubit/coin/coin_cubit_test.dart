import 'package:cryptocurrency/domain/usecases/get_coins.dart';
import 'package:cryptocurrency/ui/cubits/coin/coin_cubit.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockGetCoins extends Mock implements GetCoins {}

void main() {
  group('CoinCubit', () {
    MockGetCoins mockGetCoins = MockGetCoins();
    blocTest<CoinCubit, CoinState>(
      'emits nothing when no method is called',
      build: () => CoinCubit(getCoins: mockGetCoins),
      expect: () => <CoinState>[],
    );
  });
}