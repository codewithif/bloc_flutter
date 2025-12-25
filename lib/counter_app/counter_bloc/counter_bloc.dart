import 'package:bloc_flutter/counter_app/counter_bloc/counter_event.dart';
import 'package:bloc_flutter/counter_app/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterBloc  extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(CounterState(counter: 0)){
  on<IncrementEvent>(_onIncrementEvent);
  on<DecrementEvent>(_onDecrementEvent);
  }
  _onIncrementEvent(IncrementEvent event,Emitter<CounterState> emit){
    emit(CounterState(counter: state.counter+1));
  }
  _onDecrementEvent(DecrementEvent event,Emitter<CounterState> emit){
    if(state.counter==0){
      return;
    }
    emit(CounterState(counter: state.counter-1));
  }
}