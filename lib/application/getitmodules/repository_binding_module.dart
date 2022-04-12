import 'package:flutter_lecture_clean_code/application/db/app_data_base.dart';
import 'package:flutter_lecture_clean_code/data/source/users/local/db/user_dao.dart';
import 'package:flutter_lecture_clean_code/data/source/users/local/users_local_repository.dart';
import 'package:flutter_lecture_clean_code/data/source/users/remote/users_remote_repository.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_data_source.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_repository.dart';
import 'package:get_it/get_it.dart';

//Providers
class RepositoryBindingModule {
  static provideModules() {
    _provideUsersRepository();
  }

  static _provideUsersRepository() {
    GetIt.I.registerSingleton<UsersDataSourceRemote>(UsersRemoteRepository(GetIt.I.get()));
    GetIt.I.registerSingletonWithDependencies<UsersDataSourceLocal>(()=>UsersLocalRepository(GetIt.I.get()),dependsOn: [UserDao]);
    GetIt.I.registerSingletonWithDependencies(()=>UsersRepository(GetIt.I.get(),GetIt.I.get()),dependsOn: [UsersDataSourceLocal]);
  }
}
