import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'user.g.dart';

@JsonSerializable()
@Entity(tableName: User.USER_TABLE)
class User {

  static const USER_TABLE = "user";

  @primaryKey
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'age')
  final int? age;
  @JsonKey(name: 'subject')
  final String? subject;

  User(this.id,this.name, this.age, this.subject,);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age, subject: $subject}';
  }
}

// flutter pub run build_runner build
// flutter pub run build_runner watch
//flutter pub run build_runner build --delete-conflicting-outputs

