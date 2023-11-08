import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';

class LocalDataSource{
  List<Todo> todos = [];

  Future<List<Todo>> getTodoFromCache() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final jsonTodoList = pref.getString('cached_todos');
    if (jsonTodoList != null && jsonTodoList.isNotEmpty) {
      return todos = jsonDecode(jsonTodoList) as List<Todo>;
    } else {
      return todos;
    }

  }

  Future<void> setTodoToCache(List<Todo> todos) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('cached_todos', jsonEncode(todos));
    print('Todos to write Cache: ${todos.length}');
  }

}