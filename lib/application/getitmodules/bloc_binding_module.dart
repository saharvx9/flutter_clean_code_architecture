import 'package:flutter_lecture_clean_code/pages/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../pages/home/home_bloc.dart';

class BlocBindingModule {

  //Providers
  static provideModules() {
    GetIt.I.registerFactory(() => HomeBloc(GetIt.I.get()));
    GetIt.I.registerFactory(() => HomeCubit(GetIt.I.get()));
  }
}