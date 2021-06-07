import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/data/source/users/local/db/user_dao.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_data_source.dart';

class UsersLocalRepository implements UsersDataSourceLocal{
  final UserDao _userDao;
  List<User>? _userListCache;

  UsersLocalRepository(this._userDao);

  @override
  Future<List<User>?> loadUsersCache() async {
    return _userListCache;
  }

  @override
  Future<void> saveUsersCache(List<User>? users) {
    return Future(()=> _userListCache = users);
  }

  @override
  Future<List<User>?> loadUsersDb() {
    return _userDao.findAllUser();
  }

  @override
  Future<void> saveUsersDb(List<User> users) {
    return _userDao.insertUsers(users);
  }

}