import 'package:flutter_lecture_clean_code/data/model/user/user.dart';

class UsersDataSourceLocal {
  Future<void> saveUsers(List<User> users) {}

  Future<List<User>> loadUsers() {}
}

class UsersDataSourceRemote {

  Future<List<User>> getUsers() {}
}