import 'package:bloc_flutter/todo_app/model/todo_model.dart';

abstract class TodoEvent {}

class LoadTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todo;
  AddTodoEvent({required this.todo});
}

class UpdateTodoEvent extends TodoEvent {
  final TodoModel todo;
  UpdateTodoEvent({required this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  DeleteTodoEvent({required this.id});
}
