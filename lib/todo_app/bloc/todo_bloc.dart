import 'package:bloc_flutter/todo_app/bloc/todo_event.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_state.dart';
import 'package:bloc_flutter/todo_app/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState>{
  final List<TodoModel> allTodos = [];
  TodoBloc():super(TodoLoading()){
    on<LoadTodoEvent>(_onLoadTodoEvent);
    on<AddTodoEvent>(_onAddTodoEvent);
    on<UpdateTodoEvent>(_onUpdateTodoEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);

  }
  _onLoadTodoEvent(LoadTodoEvent event,Emitter<TodoState> emit){
    emit(TodoLoaded(data: allTodos));
  }
  _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit){
    final TodoModel userProvidedData = event.todo;
    allTodos.add(userProvidedData);
    emit(TodoLoaded(data: allTodos,msg: "Item added successfully!"));
  }
  _onUpdateTodoEvent(UpdateTodoEvent event,Emitter<TodoState> emit){
    final TodoModel todoModel = event.todo;
    final todoItemId = todoModel.id;
    final index = allTodos.indexWhere((t)=>t.id==todoItemId);
    if(index!=-1){
      allTodos[index] = todoModel;
      final msg = todoModel.isCompleted?"Task is successfully completed!":"Task is pending";
      emit(TodoLoaded(data: allTodos,msg:msg ));
    }
  }

  _onDeleteTodoEvent(DeleteTodoEvent event,Emitter<TodoState> emit){
    final itemId = event.id;
    final indexItem = allTodos.indexWhere((t)=>t.id==itemId);
    if(indexItem!=-1){
      allTodos.removeAt(indexItem);
      emit(TodoLoaded(data: allTodos,msg:"Item deleted successfully!" ));

    }

  }

@override
  void onChange(Change<TodoState> change) {
    print("${change.currentState.runtimeType}");
    super.onChange(change);
  }
  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
   print("transition event + current state::${transition.event.runtimeType} + ${transition.currentState.runtimeType}");
    super.onTransition(transition);
  }

}