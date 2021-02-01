import 'package:flutter_lecture_clean_code/data/model/user/user.dart';

class UsersDataSourceLocal {
  Future<void> saveUsersCache(List<User> users) {}

  Future<List<User>> loadUsersCache() {}

  Future<void> saveUsersDb(List<User> users) {}

  Future<List<User>> loadUsersDb() {}
}

class UsersDataSourceRemote {

  Future<List<User>> getUsers() {}
}