import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/data/source/users/local/db/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_data_base.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}