import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lecture_clean_code/data/model/user/user.dart';
import 'package:flutter_lecture_clean_code/utils/size_config.dart';

import '../home_states_events.dart';
import '../home_states_events.dart';

class UsersListView extends StatelessWidget {
  final BaseHomeState state;
  final Function(User user) onClickUser;

  const UsersListView(
      {Key? key, required this.state, required this.onClickUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state.runtimeType) {
      case LoadingState:
        return _circularProgress();
      case UsersListResult:
        final users = (state as UsersListResult).users;
        return _usersListView(users);
      case ErrorState:
        final message = (state as ErrorState).message;
        return _errorState(message);
      default: //will be InitialState
        return _firstTime();
    }
  }

  Widget _firstTime() {
    return Center(
      child: Text("Please press at the top button to load users users :)"),
    );
  }

  Widget _errorState(String? message) {
    return Center(
        child: Text(
      message ?? "Failed load users",
      style: TextStyle(color: Colors.red),
    ));
  }

  Widget _circularProgress() {
    return Center(
      child: SizedBox(
          height: SizeConfig.screenHeight / 5,
          width: SizeConfig.screenHeight / 5,
          child: CircularProgressIndicator()),
    );
  }

  Widget _usersListView(List<User> users) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      itemBuilder: (context, index) => _userItem(users[index]),
    );
  }

  Widget _userItem(User user) {
    return ListTile(
      onTap: () => onClickUser(user),
      leading: Icon(Icons.account_box_rounded),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${user.name}"),
          Text(user.age.toString()),
          Text("${user.subject}"),
        ],
      ),
    );
  }
}
