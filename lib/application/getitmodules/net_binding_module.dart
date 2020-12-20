import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import '../../main.dart';
import 'package:flutter_lecture_clean_code/data/source/users/api/users_api.dart';

class NetBindingModule {

  static provideNetModules(){
    _provideDio();
    _provideUsersApi();
  }

  static _provideDio(){
    getIt.registerFactory(() {
      final dio = Dio();
      if(kDebugMode) dio.interceptors.add(PrettyDioLogger(requestBody: true ));
      return dio;
    });
  }

  static void _provideUsersApi() => getIt.registerFactory(() => UsersApi(getIt.get()));

}