// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facebook_login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacebookLoginProfileJSONResponse _$FacebookLoginProfileJSONResponseFromJson(
    Map<String, dynamic> json) {
  return FacebookLoginProfileJSONResponse(
    json['name'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['picture'] == null
        ? null
        : FacebookProfilePicData.fromJson(
            json['picture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FacebookLoginProfileJSONResponseToJson(
        FacebookLoginProfileJSONResponse instance) =>
    <String, dynamic>{
      'name': instance.fullName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'picture': instance.data?.toJson(),
    };

FacebookProfilePicData _$FacebookProfilePicDataFromJson(
    Map<String, dynamic> json) {
  return FacebookProfilePicData(
    json['data'] == null
        ? null
        : FaceBookProfilePic.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FacebookProfilePicDataToJson(
        FacebookProfilePicData instance) =>
    <String, dynamic>{
      'data': instance.pic?.toJson(),
    };

FaceBookProfilePic _$FaceBookProfilePicFromJson(Map<String, dynamic> json) {
  return FaceBookProfilePic(
    json['url'] as String,
  );
}

Map<String, dynamic> _$FaceBookProfilePicToJson(FaceBookProfilePic instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
