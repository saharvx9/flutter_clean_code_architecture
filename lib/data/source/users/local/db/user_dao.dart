import 'package:floor/floor.dart';
import 'package:flutter_lecture_clean_code/data/model/user/user.dart';

@dao
abstract class UserDao {

  @Query('SELECT * FROM ${User.USER_TABLE}')
  Future<List<User>?> findAllUser();

  @Query('SELECT * FROM ${User.USER_TABLE} WHERE id = :id')
  Stream<User?> findUserById(int id);

  ///UPSERT - insert or update user
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User user);

  ///UPSERT - insert or update users
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUsers(List<User> users);
}