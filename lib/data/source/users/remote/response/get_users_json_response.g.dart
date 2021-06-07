// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersJSONResponse _$GetUsersJSONResponseFromJson(Map<String, dynamic> json) {
  return GetUsersJSONResponse(
    (json['users_list'] as List<dynamic>)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetUsersJSONResponseToJson(
        GetUsersJSONResponse instance) =>
    <String, dynamic>{
      'users_list': instance.users.map((e) => e.toJson()).toList(),
    };
