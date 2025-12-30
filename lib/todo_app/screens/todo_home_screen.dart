import 'dart:math';

import 'package:bloc_flutter/todo_app/bloc/todo_bloc.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_event.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_state.dart';
import 'package:bloc_flutter/todo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomeScreen extends StatelessWidget {
  const TodoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app with bloc"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
               title: Text("Add your todo item"),
               content: Column(
                 mainAxisSize: .min,
                 children: [
                   TextFormField(
                     controller:_titleController ,
                     decoration: InputDecoration(
                       filled: true,
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12)
                       ),
                       hintText: "Add title "
                     ),
                   ),
                   SizedBox(height: 8,),
                   ElevatedButton(onPressed: (){
                     if(_titleController.text.isNotEmpty) {
                       final String id = DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(1000).toString();
                      print("id for todo model :: $id");
                       final todo = TodoModel(id: id,
                           title: _titleController.text.trim(),
                           isCompleted: false);
                       context.read<TodoBloc>().add(AddTodoEvent(todo: todo));
                       _titleController.clear();
                       Navigator.of(context).pop();
                     }
                   }, child: Text("Add your todo item"))
                 ],
               ), 
              );
            });
        }),
      body: BlocConsumer<TodoBloc,TodoState>(
          listener: (context,state){
            if(state is TodoLoaded){
              final msg = state.msg;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: msg!.contains("delete")?Colors.red:Colors.green,
                  content: Text(msg!)));
            }
          },
          builder: (context,state){
        if(state is TodoLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        if(state is TodoLoaded){
          return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, int index){
            final data = state.data[index];
            return ListTile(
              leading: Checkbox(value:data.isCompleted, onChanged: (newVal){
                final updatedModel = data.copyWith(isCompleted:newVal );
context.read<TodoBloc>().add(UpdateTodoEvent(todo: updatedModel));
              }),
              title: Text(data.title,style: TextStyle(decoration:data.isCompleted? TextDecoration.lineThrough:TextDecoration.none),),
              trailing: IconButton(onPressed: (){
                context.read<TodoBloc>().add(DeleteTodoEvent(id: data.id));
              }, icon: Icon(Icons.delete)),
            );
          });
        }
        if(state is TodoError){
          return Center(child: Text(state.errMsg),);
        }
        return SizedBox();
      })
    );
  }
}
