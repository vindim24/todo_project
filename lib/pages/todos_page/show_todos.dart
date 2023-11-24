import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/cubits/cubits.dart';
import 'package:todo_project/pages/todos_page/todo_item.dart';

import '../../Constants.dart';

class ShowTodos extends StatelessWidget {
  ShowTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            onDismissed: (_) {
              context.read<TodoListCubit>().removeTodo(todos[index]);
            },
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            child: TodoItem(
              todo: todos[index],
              index: index,
            ),
          );
        },
        itemCount: todos.length);
  }

  Widget showBackground(int alignment) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              colors: alignment == 0
                  ? [
                      Colors.red,
                      Constants.backgroundColor,
                    ]
                  : [
                      Constants.backgroundColor,
                      Colors.red,
                    ])),
      alignment: alignment == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
