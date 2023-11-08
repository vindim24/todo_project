import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/utils/local_data_source.dart';

import '../../cubits/active_todo_count/active_todo_count_cubit.dart';

class ActiveTodoCountBar extends StatefulWidget {
  const ActiveTodoCountBar({super.key});

  @override
  State<ActiveTodoCountBar> createState() => _ActiveTodoCountBarState();
}

class _ActiveTodoCountBarState extends State<ActiveTodoCountBar> {

  Color _currentColor = Colors.red;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 650), (Timer timer){
      setState(() {
        _currentColor =
        _currentColor == Colors.red ? Color(0xFF210001): Colors.red;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: _currentColor,
                shape: BoxShape.circle
            ),
          ),
          const SizedBox(width: 3,),
          BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                '${state.activeTodoCount} in process..', // in process..
              );
            },
          ),
        ],
      ),
    );
  }
}
