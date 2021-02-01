// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UsersApi implements UsersApi {
  _UsersApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.86.66:5000/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<GetUsersJSONResponse> getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('users',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetUsersJSONResponse.fromJson(_result.data);
    return value;
  }
}
