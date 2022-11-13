import 'package:cryptocurrency/data/datasources/coin_remote_data_source.dart';
import 'package:cryptocurrency/data/repositories/coin_repository_impl.dart';
import 'package:cryptocurrency/domain/repositories/coin_repository.dart';
import 'package:cryptocurrency/domain/usecases/get_coin_details.dart';
import 'package:cryptocurrency/domain/usecases/get_coins.dart';
import 'package:cryptocurrency/ui/cubits/coin_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  // ui
  sl.registerFactory(() => CoinCubit(getCoins: sl()));

  // domain
  // use cases
  sl.registerFactory(() => GetCoins(coinRepository: sl()));
  sl.registerFactory(() => GetCoinDetails(coinRepository: sl()));

  // data
  sl.registerFactory<CoinRepository>(() => CoinRepositoryImpl(coinRemoteDataSource: sl()));
  sl.registerFactory<CoinRemoteDataSource>(() => CoinRemoteDataSourceImpl(client: sl()));

  // extern
  sl.registerFactory(() => http.Client());
}