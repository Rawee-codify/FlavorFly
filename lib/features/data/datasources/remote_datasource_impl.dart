import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/features/data/datasources/remote_data_source.dart';

import '../../../core/network/api_helper.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper? apiHelper;
  final FlutterSecureStorage? secureStorage;
  final String baseUrl = dotenv.get('APP_BASE_URL');

  RemoteDataSourceImpl({required this.apiHelper, required this.secureStorage});
}
