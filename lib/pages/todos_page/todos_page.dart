import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_project/pages/todos_page/search_and_filter_todo.dart';
import 'package:todo_project/pages/todos_page/show_todos.dart';
import 'package:todo_project/pages/todos_page/todo_header.dart';

import '../../constants.dart';
import 'create_todo.dart';

class TodosPage extends StatefulWidget {
  TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  Color _currentColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TodoHeader(),
                  CreateTodo(),
                  const SizedBox(height: 25,),
                  SearchAndFilterTodo(),
                  ShowTodos(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
