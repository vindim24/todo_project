part of 'todo_search_cubit.dart';

class TodoSearchState {
  final String searchTerm;

  TodoSearchState({required this.searchTerm});

  factory TodoSearchState.initial(){
    return TodoSearchState(searchTerm: '');
  }
  
  TodoSearchState copyWith({String? searchTerm}){
    return TodoSearchState(searchTerm: searchTerm ?? this.searchTerm);
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() {
    return 'TodoSearchState{searchTerm: $searchTerm}';
  }
}
