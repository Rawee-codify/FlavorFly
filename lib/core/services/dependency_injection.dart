import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/features/data/datasources/datasource_barrel.dart';
import 'package:flutter_template/features/data/repository/repository_impl_barrel.dart';
import 'package:flutter_template/features/domain/repository/repository_barrel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../network/network_barrel.dart';

final injection = GetIt.I;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  const secreteStorage = FlutterSecureStorage();
  injection.registerLazySingleton(() => secreteStorage);
  injection.registerLazySingleton(() => sharedPreferences);
  injection.registerSingleton(http.Client());
  injection.registerSingleton(LocalDataSource(
    sharedPreferences: injection(),
    securePreferences: injection(),
  ));
  injection.registerLazySingleton<APIHelper>(() => APIHelper(
    // localDataSource: injection(),
    client: injection(),
  ));
  injection.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
        apiHelper: injection(), secureStorage: injection()),
  );
  injection.registerLazySingleton(() => Connectivity());
  injection.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injection(),
  ));
  injection.registerLazySingleton<Repository>(
        () => RepositoryImpl(
      remoteDataSource: injection(),
      localDataSource: injection(),
      networkInfo: injection(),
    ),
  );

// useCases

}
