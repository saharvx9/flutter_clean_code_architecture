import 'package:dio/dio.dart';
import 'package:flutter_lecture_clean_code/application/application/api_configuration.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_lecture_clean_code/data/source/users/remote/response/get_users_json_response.dart';
part 'users_api.g.dart';
@RestApi(baseUrl: ApiConfiguration.BASE_URL)
abstract class UsersApi {
  factory UsersApi(Dio dio,{String baseUrl}) = _UsersApi;

  @GET("users")
  Future<GetUsersJSONResponse> getUsers();
}