import 'package:flutter_template/core/network/network_barrel.dart';
import 'package:flutter_template/features/data/datasources/datasource_barrel.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource? remoteDataSource;
  final NetworkInfo? networkInfo;
  final LocalDataSource? localDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
    this.networkInfo,
    this.localDataSource,
  });

  @override
  Future<bool> isDark() async {
    return localDataSource!.getBool(LocalStorageKey.isDark);
  }

  @override
  Future<bool> updateThemeMode({required bool isDark}) async {
    return localDataSource!.setBool(LocalStorageKey.isDark, isDark);
  }
}
