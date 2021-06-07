import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_data_source.dart';

class UsersRepository {
  final UsersDataSourceLocal _local;
  final UsersDataSourceRemote _remote;

  UsersRepository(this._local, this._remote);



  ///
  /// Load users
  ///
  /// first load users from local repository (in our Floor db)
  /// then check if its not null or empty,
  /// in case false return current results
  /// in case true load it from api,save it in out local db then load it
  ///
  /// CACHING ENGINE WITH REPOSITORY PATTERN
  /// -----------------
  /// Local   Remote
  ///   Repository
  /// -----------------
  ///
  Future<List<User>?> loadUsersDb() {
    return _local.loadUsersDb().then((usersDb) {
      if (usersDb == null || usersDb.isEmpty) {
        return _remote
            .getUsers()
            .then((users) => _local.saveUsersDb(users))
            .then((_) => _local.loadUsersDb());
      } else {
        return usersDb;
      }
    });
  }

  ///
  /// LoadUsers from Cache
  /// same logic as [loadUsersCache] function
  /// but instead saving on LOCAL-DB we are using CACHE-MEMORY
  ///
  Future<List<User>?> loadUsersCache() {
    return _local.loadUsersCache().then((localUsers) {
      if (localUsers == null) {
        return _remote
            .getUsers()
            .then((users) => _local.saveUsersCache(users))
            .then((_) => _local.loadUsersCache());
      } else {
        return localUsers;
      }
    });
  }
}
