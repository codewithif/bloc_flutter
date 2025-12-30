
import 'package:bloc_flutter/todo_app/bloc/todo_bloc.dart';
import 'package:bloc_flutter/todo_app/my_bloc_observer/my_bloc_observer.dart';
import 'package:bloc_flutter/todo_app/screens/todo_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
 Bloc.observer = MyBlocObserver();

  runApp(TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>TodoBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHomeScreen(),
    ),);
  }
}
