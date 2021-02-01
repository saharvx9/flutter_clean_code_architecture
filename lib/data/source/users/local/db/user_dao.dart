import 'package:floor/floor.dart';
import 'package:flutter_lecture_clean_code/data/model/user/user.dart';

@dao
abstract class UserDao {

  @Query('SELECT * FROM User')
  Future<List<User>> findAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User> findUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @insert
  Future<void> insertUsers(List<User> users);
}