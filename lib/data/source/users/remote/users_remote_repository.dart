import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_data_source.dart';
import 'package:flutter_lecture_clean_code/data/source/users/api/users_api.dart';

class UsersRemoteRepository implements UsersDataSourceRemote{

  final UsersApi _api;

  UsersRemoteRepository(this._api);

  @override
  Future<List<User>> getUsers() {
    return _api.getUsers().then((response) => response.users);
  }

}