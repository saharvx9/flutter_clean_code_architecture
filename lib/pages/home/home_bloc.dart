import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_repository.dart';
import 'package:flutter_lecture_clean_code/pages/home/home_states_events.dart';

class HomeBloc extends Bloc<BaseHomeEvent,BaseHomeState> {

  final UsersRepository _usersRepository;
  HomeBloc(this._usersRepository) : super(InitialState());


  ///
  /// mapEventToState
  ///
  /// StreamController wrapper for receiving events [BaseHomeEvent]
  /// then emit states [BaseHomeState] depend current event
  ///
  @override
  Stream<BaseHomeState> mapEventToState(BaseHomeEvent event) async* {
    switch(event.runtimeType){
      case ClearListEvent:
        yield UsersListResult(List());
        break;
      case GetUsersListEvent:
        yield LoadingState();
        yield* _usersRepository.loadUsers().asStream().map((users) => UsersListResult(users));
        break;
      default:
        yield InitialState();
        break;
    }
  }
}