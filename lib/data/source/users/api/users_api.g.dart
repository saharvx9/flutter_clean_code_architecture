// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UsersApi implements UsersApi {
  _UsersApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.191.4.22:5000/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetUsersJSONResponse> getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetUsersJSONResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetUsersJSONResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
