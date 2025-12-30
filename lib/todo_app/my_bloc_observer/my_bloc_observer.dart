import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    print(
      "current state in bloc observer:: ${change.currentState.runtimeType}",
    );
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    print("current state in bloc observer:: ${event.runtimeType}");

    super.onEvent(bloc, event);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    print(
      "current state in bloc observer:: ${transition.event.runtimeType} + state ${transition.currentState}",
    );
    super.onTransition(bloc, transition);
  }
}
