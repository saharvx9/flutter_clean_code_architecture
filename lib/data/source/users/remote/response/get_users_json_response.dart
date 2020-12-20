import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_users_json_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUsersJSONResponse {

  @JsonKey(name: "users_list")
  final List<User> users;

  GetUsersJSONResponse(this.users);

  factory GetUsersJSONResponse.fromJson(Map<String, dynamic> json) => _$GetUsersJSONResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUsersJSONResponseToJson(this);


}