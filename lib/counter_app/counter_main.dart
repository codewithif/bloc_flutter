import 'package:bloc_flutter/counter_app/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_home.dart';

void main(){
  runApp(CounterApp());
}
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>CounterBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterHome(),
    ),);
  }
}
