import 'package:flutter/material.dart';
import 'package:flutter_lecture_clean_code/application/getitmodules/data_binding_module.dart';
import 'package:flutter_lecture_clean_code/pages/home/home_page.dart';
import 'package:get_it/get_it.dart';

import 'application/getitmodules/bloc_binding_module.dart';
import 'application/getitmodules/net_binding_module.dart';
import 'application/getitmodules/repository_binding_module.dart';

/// This is our global ServiceLocator/Dependency injection
GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetItModules();
  runApp(FutureBuilder(
    future: getIt.allReady(),
    builder: (context, snapshot) {
      final doneInitAll = snapshot.connectionState == ConnectionState.done;
      return doneInitAll ? MyApp() : Loader();
    }
  ));
}

registerGetItModules(){
  NetBindingModule.provideNetModules();
  DataBindingModule.providesModules();
  RepositoryBindingModule.provideModules();
  BlocBindingModule.provideModules();
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}



