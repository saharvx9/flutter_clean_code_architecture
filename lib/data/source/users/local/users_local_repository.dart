import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_data_source.dart';

class UsersLocalRepository implements UsersDataSourceLocal{

  List<User> _userListCache;

  @override
  Future<List<User>> loadUsers() async {
    return _userListCache;
  }

  @override
  Future<void> saveUsers(List<User> users) {
    return Future(()=> _userListCache = users);
  }

}