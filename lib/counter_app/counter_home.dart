import 'package:bloc_flutter/counter_app/counter_bloc/counter_bloc.dart';
import 'package:bloc_flutter/counter_app/counter_bloc/counter_event.dart';
import 'package:bloc_flutter/counter_app/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              IconButton(onPressed: (){
context.read<CounterBloc>().add(DecrementEvent());
              }, icon: Icon(Icons.remove)),
BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
  return Text("Counter:${state.counter.toString()} ");
}),
              IconButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementEvent());
              }, icon: Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
