import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lecture_clean_code/data/source/users/users_repository.dart';
import 'package:flutter_lecture_clean_code/pages/home/home_states_events.dart';
import 'package:dio/dio.dart';


///
///
/// ~~~~~~~~~~~~ BEFORE LOOKING AT THE CODE ~~~~~~~~~~~~~~~~~~~
/// **PLEASE NOTICE:
/// I added tow ways working with BLOC
/// [Cubit]        - newest way
/// Regular [Bloc] - old way but still nice
///
/// The diff between them
/// You can use both or just one of them
/// it ok,dont worry, the diff between them it just convenience writing
///
///      Cubit                    |     Bloc(Old)
/// 1. Using state                |  Using states
/// 2. Using Functions as events  |  Using events as object
/// 3. Emit states with emit      |  Emit states mapEventToState with yield or yield*
///


/// UPDATE TO CUBIT INSTEAD OF BLOC
/// Using only states and functions
/// Instead of EVENT,STATES
class HomeCubit extends Cubit<BaseHomeState> {

  final UsersRepository _usersRepository;
  HomeCubit(this._usersRepository) : super(InitialState());


  ///
  /// Clear list
  /// Emit empty list
  ///
  clearList(){
    emit(UsersListResult([]));
  }

  ///
  /// Get users
  ///
  /// first emit [LoadingState] for update our ui
  /// then load our users from server/local
  /// then emit [User] list in case they null with [UsersListResult] state
  /// we are using users??[] , for preventing from null issues
  /// In case we got an error:
  /// [DioError] :
  /// Extract al necessary props,for our example we take:
  /// status code,error,stackTrace
  /// building custom message
  /// then emit [ErrorState]
  /// in case we don't know what is the error i catch all errors and emit it
  ///
  getUsers() async {
    emit(LoadingState());
    try{
      // load users from cache after receiving it from server
      final users = await _usersRepository.loadUsersDb();
      //NOTICE! if we want to work with cache and server uncomment this line
      // final users = await _usersRepository.loadUsersCache();
      emit(UsersListResult(users??[]));
    } on DioError catch (dioError){
      // Handle dio errors
      final code = dioError.response?.statusCode;
      final error = dioError.error;
      final stackTrace = dioError.stackTrace;
      final message = "Failed load users,status code: $code, error: $error";
      emit(ErrorState(message,stackTrace));
    } catch(e,stackTrace){
      final message = "failed load users: $e";
      emit(ErrorState(message,stackTrace));
    }
  }
}

///
/// OLD WAY
/// Bloc<BaseHomeEvent,BaseHomeState>
/// Using EVENTS and STATES
/// If someone like this type more than cubit its ok
///
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
        yield UsersListResult([]);
        break;
      case GetUsersListEvent:
        yield LoadingState();
        // Choose which saving type are you want DB/CACHE
        // yield* _usersReposit ory.loadUsersCache().asStream().map((users) => UsersListResult(users));
        yield* _usersRepository.loadUsersDb().asStream().map((users) => UsersListResult(users??[]));
        break;
      default:
        yield InitialState();
        break;
    }
  }
}