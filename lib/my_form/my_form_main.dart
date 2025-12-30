import 'package:bloc_flutter/my_form/my_form_bloc/my_form_bloc.dart';
import 'package:bloc_flutter/my_form/my_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MyFormApp());
}
class MyFormApp extends StatelessWidget {
  const MyFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>MyFormBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFormScreen(),
    ),);
  }
}
