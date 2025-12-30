import 'package:bloc_flutter/my_form/my_form_bloc/my_form_bloc.dart';
import 'package:bloc_flutter/my_form/my_form_bloc/my_form_event.dart';
import 'package:bloc_flutter/my_form/my_form_bloc/my_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFormScreen extends StatelessWidget {
  const MyFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text("Notifications"),
             BlocBuilder<MyFormBloc,MyFormState>(
               builder: (context,state){
                 return  Switch(value: state.isSwitched, onChanged: (newvalue){
context.read<MyFormBloc>().add(
  SwitchEvent(isSwitched: newvalue)
);
                 });
               },
             ),


            ],
          ),
         BlocBuilder<MyFormBloc,MyFormState>(builder: (context,state){
           return  Column(
             children: [
               Container(
                 height: 200,
                 width: 200,
                 color: Colors.red.withValues(alpha: state.sliderValue),
               ),
               Slider(value: state.sliderValue, onChanged: (newvalue){
                 context.read<MyFormBloc>().add(SliderEvent(SliderValue: newvalue));
               }),
             ],
           );
         })
        ],
      ),
    );
  }
}
