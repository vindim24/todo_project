import 'package:bloc/bloc.dart';

import '../../models/todo_model.dart';
import '../../utils/local_data_source.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {

  LocalDataSource _localDataSource = LocalDataSource();

  TodoListCubit() : super(TodoListState.initial());


  void addTodo(String todoDesc){
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [...state.todos, newTodo];

    _localDataSource.setTodoToCache(newTodos);
    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  void editTodo(String id, String todoDesc){
    final newTodos = state.todos.map((Todo todo){
      if(todo.id == id) {
        return Todo(id: id, desc: todoDesc, completed: todo.completed);
    }
      return todo;
    }).toList();

    _localDataSource.setTodoToCache(newTodos);
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id){
    final newTodos = state.todos.map((Todo todo){
      if(todo.id == id){
        return Todo(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    _localDataSource.setTodoToCache(newTodos);
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(Todo todo){
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();

    _localDataSource.setTodoToCache(newTodos);
    emit(state.copyWith(todos: newTodos));
  }
}
