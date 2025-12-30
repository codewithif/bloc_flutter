import 'package:bloc_flutter/my_form/my_form_bloc/my_form_event.dart';
import 'package:bloc_flutter/my_form/my_form_bloc/my_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFormBloc extends Bloc<MyFormEvent,MyFormState>{
  MyFormBloc():super(MyFormState(isSwitched: false)){
    on<SwitchEvent>(_onSwitchEvent);
    on<SliderEvent>(_onSliderEvent);
  }
  _onSwitchEvent(SwitchEvent event,Emitter<MyFormState> emit){
    print("state of switch: ${event.isSwitched}");
    emit(MyFormState(isSwitched: event.isSwitched));
  }
  _onSliderEvent(SliderEvent event,Emitter<MyFormState> emit){
    emit(MyFormState(sliderValue: event.SliderValue));
  }
}