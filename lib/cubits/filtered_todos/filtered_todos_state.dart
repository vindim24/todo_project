part of 'filtered_todos_cubit.dart';

class FilteredTodosState {
  final List<Todo> filteredTodos;

  FilteredTodosState({required this.filteredTodos});

  factory FilteredTodosState.initial(){
    return FilteredTodosState(filteredTodos: []);
  }

  @override
  String toString() {
    return 'FilteredTodosState{todos: $filteredTodos}';
  }

  FilteredTodosState copyWith({List<Todo>? filteredTodos}){
    return FilteredTodosState(filteredTodos: filteredTodos ?? this.filteredTodos);
  }

  @override
  List<Object> get props => [filteredTodos];
}
