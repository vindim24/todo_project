import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/cubits/active_todo_count/active_todo_count_cubit.dart';

import 'active_todo_count_bar.dart';

class TodoHeader extends StatefulWidget {
  TodoHeader({super.key});

  @override
  State<TodoHeader> createState() => _TodoHeaderState();
}

class _TodoHeaderState extends State<TodoHeader> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TODO',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        ActiveTodoCountBar(),
      ],
    );
  }
}
