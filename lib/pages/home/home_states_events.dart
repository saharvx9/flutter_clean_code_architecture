import 'package:flutter_lecture_clean_code/data/model/user/user.dart';

///
/// HOME EVENTS
///
/// which event we will send to bloc
///
abstract class BaseHomeEvent {}

class GetUsersListEvent extends BaseHomeEvent {}

class ClearListEvent extends BaseHomeEvent {}

class ErrorEvent extends BaseHomeEvent {}

///
/// HOME STATES
///
/// states that we will receive from home bloc
///
abstract class BaseHomeState {}

class InitialState extends BaseHomeState {}

class LoadingState extends BaseHomeState {}

class UsersListResult extends BaseHomeState {
  final List<User> users;

  UsersListResult(this.users);
}

class ErrorState extends BaseHomeState {}
