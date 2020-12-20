import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
part 'facebook_login_result.g.dart';

@JsonSerializable(explicitToJson: true)
class FacebookLoginProfileJSONResponse {
  @JsonKey(name:"name")
  final String fullName;
  @JsonKey(name:"first_name")
  final String firstName;
  @JsonKey(name:"last_name")
  final String lastName;
  @JsonKey(name:"picture")
  final FacebookProfilePicData data;
  @JsonKey(ignore:true)
  File profilePicFile;
  
  String get imageUrl => data.pic.url;

  FacebookLoginProfileJSONResponse(this.fullName, this.firstName, this.lastName, this.data);

  factory FacebookLoginProfileJSONResponse.fromJson(Map<String, dynamic> json) {
    print("sahar FacebookLoginProfileJSONResponse!!");
    return _$FacebookLoginProfileJSONResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FacebookLoginProfileJSONResponseToJson(this);
  }

  // Map<String,dynamic>  get gymeUserDetails => {
  //   "full_name_arr": fullName.divideStringForParts(),
  // };
}

@JsonSerializable(explicitToJson: true)
class FacebookProfilePicData{
  @JsonKey(name:"data")
  final FaceBookProfilePic pic;

  FacebookProfilePicData(this.pic);

  factory FacebookProfilePicData.fromJson(Map<String, dynamic> json) {
    return _$FacebookProfilePicDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FacebookProfilePicDataToJson(this);
}

@JsonSerializable()
class FaceBookProfilePic {
  @JsonKey(name:"url")
  final String url;

  FaceBookProfilePic(this.url);

  factory FaceBookProfilePic.fromJson(Map<String, dynamic> json) {
    return _$FaceBookProfilePicFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FaceBookProfilePicToJson(this);
}