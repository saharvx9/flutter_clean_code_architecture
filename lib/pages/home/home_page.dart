import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lecture_clean_code/main.dart';
import 'package:flutter_lecture_clean_code/pages/home/widgets/users_list_view.dart';
import 'package:flutter_lecture_clean_code/utils/size_config.dart';
import 'package:flutter_lecture_clean_code/widgets/custom_button.dart';

import 'home_bloc.dart';
import 'home_states_events.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Clean Code With Bloc"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.spacing_small_horizontal,
            vertical: SizeConfig.spacing_small_vertical),
        child: BlocProvider<HomeCubit>(
          create: (context) => getIt.get<HomeCubit>(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _clearButton(),
                  _button(),
                ],
              ),
              SizedBox(height: SizeConfig.spacing_medium_vertical,),
              Expanded(child: _usersBlocHandler()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(){
    return BlocBuilder<HomeCubit, BaseHomeState>(
      builder: (context, state) {
        final enable = state is! LoadingState;
        return CustomButton(
          enable: enable,
          text: "load users",
          color: enable ? Colors.blue :Colors.grey.withOpacity(0.5),
          /// Old way Bloc
          // onClick: ()=> context.read<HomeBloc>().add(GetUsersListEvent()),
          /// New way Cubit
          onClick: ()=> context.read<HomeCubit>().getUsers(),
        );
      }
    );
  }
  
  Widget _clearButton(){
    return BlocBuilder<HomeCubit, BaseHomeState>(
      builder: (context,state){
          final opacity = state is UsersListResult && (state).users.isNotEmpty ? 1.0 : 0.0 ;
          return AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 300),
          child: CustomButton(
            enable: opacity == 1,
            text: "clear",
            /// Old way Bloc
            // onClick:()=> context.read<HomeCubit>().add(ClearListEvent()),
            /// New way Cubit
            onClick:()=> context.read<HomeCubit>().clearList(),
          ),);
      },
    );
  }

  Widget _usersBlocHandler() {
    return BlocBuilder<HomeCubit, BaseHomeState>(
        builder: (context, state) => UsersListView(state: state));
  }

}
