import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/cubits/cubits.dart';

import '../../Constants.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  TextEditingController newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: InputDecoration(labelText: 'What to do?',
        labelStyle: TextStyle(color: Constants.primaryColor)
      ),
      onSubmitted: (String? todoDesc){
        if(todoDesc != null && todoDesc.trim().isNotEmpty) {
          setState(() {
            context.read<TodoListCubit>().addTodo(todoDesc);
            newTodoController.clear();
          });
        }
      },
    );
  }
}
