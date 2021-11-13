import 'package:flutter_lecture_clean_code/application/db/app_data_base.dart';
import 'package:flutter_lecture_clean_code/main.dart';

//Providers
class DataBindingModule {
  static providesModules(){
    _providesFloorDb();
    _providesUserDao();
  }
  
  static _providesFloorDb(){
    getIt.registerSingletonAsync(() => $FloorAppDatabase.databaseBuilder("app_database.db").build());
  }

  static _providesUserDao(){
    getIt.registerSingletonAsync(() => getIt.getAsync<AppDatabase>().then((db) => db.userDao),dependsOn: [AppDatabase]);
  }

}