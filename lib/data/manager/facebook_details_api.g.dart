// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facebook_details_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FacebookDetailsApi implements FacebookDetailsApi {
  _FacebookDetailsApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://graph.facebook.com/v2.12/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<String> getUserDetails(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'access_token': token};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'me?fields=name,first_name,picture.width(500).height(500),last_name,email',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
