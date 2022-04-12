import 'package:flutter_lecture_clean_code/application/db/app_data_base.dart';
import 'package:get_it/get_it.dart';

//Providers
class DataBindingModule {
  static providesModules(){
    _providesFloorDb();
    _providesUserDao();
  }
  
  static _providesFloorDb(){
    GetIt.I.registerSingletonAsync(() => $FloorAppDatabase.databaseBuilder("app_database.db").build());
  }

  static _providesUserDao(){
    GetIt.I.registerSingletonAsync(() => GetIt.I.getAsync<AppDatabase>().then((db) => db.userDao),dependsOn: [AppDatabase]);
  }

}