import 'package:bloc_flutter/todo_app/model/todo_model.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> data;
  final String? msg;
  TodoLoaded({required this.data, this.msg});
}

class TodoError extends TodoState {
  final String errMsg;
  TodoError({required this.errMsg});
}
