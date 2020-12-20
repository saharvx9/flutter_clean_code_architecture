import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_data_source.dart';

class UsersRepository {
  final UsersDataSourceLocal _local;
  final UsersDataSourceRemote _remote;

  UsersRepository(this._local, this._remote);

  ///
  /// Load users
  ///
  /// first load users from local repository
  /// then check if its not null case false return current results
  /// in case true load it from api,save it in out local cache then load it
  ///
  /// CACHING ENGINE WITH REPOSITORY PATTERN
  /// -----------------
  /// Local   Remote
  ///   Repository
  /// -----------------
  ///
  Future<List<User>> loadUsers() {
    return _local.loadUsers().then((localUsers) {
      if (localUsers == null) {
        return _remote
            .getUsers()
            .then((users) => _local.saveUsers(users))
            .then((_) => _local.loadUsers());
      } else {
        return localUsers;
      }
    });
  }
}