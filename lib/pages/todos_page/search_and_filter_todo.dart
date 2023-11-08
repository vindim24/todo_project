import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constants.dart';
import '../../models/todo_model.dart';
import '../../utils/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({super.key});

  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search todos..',
              labelStyle: TextStyle(color: Constants.primaryColor),
              border: InputBorder.none,
              filled: true,
              prefix: Icon(Icons.search),
            ),
            onChanged: (String? newSearchTerm) {
              if (newSearchTerm != null) {
                debounce.run(() {
                  context.read<TodoSearchCubit>().setSearchTerm(newSearchTerm);
                });
              }
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }
}

Widget filterButton(BuildContext context, Filter filter) {
  return TextButton(
    onPressed: () {
      context.read<TodoFilterCubit>().changeFilter(filter);
    },
    child: Text(filter == Filter.all
        ? 'All'
        : filter == Filter.active
        ? 'Active'
        : 'Completed',
      style: TextStyle(fontSize: 18.0, color: textColor(context, filter),),
    ),
  );
}

Color textColor(BuildContext context, Filter filter) {
  final currentFilter = context
      .watch<TodoFilterCubit>()
      .state
      .filter;

  return currentFilter == filter ? Constants.primaryColor : Constants
      .secondaryColor;
}
