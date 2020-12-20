import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_lecture_clean_code/data/manager/facebook_login_result.dart';

part 'facebook_details_api.g.dart';

@RestApi(baseUrl: "https://graph.facebook.com/v2.12/")
abstract class FacebookDetailsApi {
  factory FacebookDetailsApi(Dio dio, {String baseUrl}) = _FacebookDetailsApi;

  @GET("me?fields=name,first_name,picture.width(500).height(500),last_name,email")
  Future<String> getUserDetails(
      @Query("access_token") String token);
}
