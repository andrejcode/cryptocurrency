import 'package:cryptocurrency/data/datasources/coin_remote_data_source.dart';
import 'package:cryptocurrency/data/exceptions/exceptions.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart';

import 'coin_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('get coins from the api', () {
    final mockClient = MockClient();
    final coinRemoteDataSourceUnderTest =
        CoinRemoteDataSourceImpl(client: mockClient);

    test('should throw a ServerException when Client response is not 200', () {
      when(mockClient.get(Uri.parse('https://api.coinpaprika.com/v1/coins/')))
          .thenAnswer((realInvocation) => Future.value(Response('', 201)));

      expect(() => coinRemoteDataSourceUnderTest.getCoinsFromApi(),
          throwsA(isA<ServerException>()));
    });
  });
}
