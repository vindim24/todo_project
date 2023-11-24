import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/cubits/cubits.dart';

import '../../Constants.dart';
import '../../models/todo_model.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final int index;

  TodoItem({Key? key, required this.todo, required this.index})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Constants.backgroundColor.withOpacity(0.2),
      child: ListTile(
        onTap: () {
          showDialog(context: context, builder: (context)
          {
            bool _error = false;
            textController.text = widget.todo.desc;

            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return AlertDialog(title: Text('Edit Todo'), content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                        errorText: _error ? 'Value cannot be empty' : null
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text('CANCEL'),),
                    TextButton(onPressed: () {
                      setState((){
                        _error = textController.text.isEmpty ? true : false;
                        if(!_error){
                          context.read<TodoListCubit>().editTodo(widget.todo.id, textController.text);
                          Navigator.pop(context);
                        }
                      });
                    }, child: Text('CONFIRM'),),
                  ],
                  );
                });
          });
        },
        leading:
        Checkbox(value: widget.todo.completed, onChanged: (bool? checked) {
          context.read<TodoListCubit>().toggleTodo(widget.todo.id);
        }),
        title: Text(
          widget.todo.desc,
          style: TextStyle(
              fontSize: 22,
              decoration: widget.todo.completed ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: Constants.peachColor.withOpacity(0.5),
              // decorationColor: Colors.red,
              // widget.index % 2 == 0
              //     ? Constants.primaryColor
              //     : Constants.secondaryColor,
              decorationThickness: 1.8,
              color: widget.index % 2 != 0
                  ? Constants.primaryColor
                  : Constants.secondaryColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
