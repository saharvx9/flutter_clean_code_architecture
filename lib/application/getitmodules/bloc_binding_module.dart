import 'package:flutter_lecture_clean_code/main.dart';
import 'package:flutter_lecture_clean_code/pages/home/home_bloc.dart';

import '../../pages/home/home_bloc.dart';

class BlocBindingModule {

  static provideModules() {
    getIt.registerFactory(() => HomeBloc(getIt.get()));
    getIt.registerFactory(() => HomeCubit(getIt.get()));
  }
}