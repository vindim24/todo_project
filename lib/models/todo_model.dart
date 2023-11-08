import 'package:uuid/uuid.dart';

enum Filter {
  all,
  active,
  completed,
}

Uuid uuid = Uuid();

class Todo {
  final String id;
  final String desc;
  final bool completed;

  Todo({String? id, required this.desc, this.completed = false})
      : this.id = id ?? uuid.v4();


  @override
  String toString() {
    return 'Todo{id: $id, desc: $desc, completed: $completed}';
  }

  @override
  List<Object> get props => [id, desc, completed];

  // Todo.fromJson(Map<String, dynamic> json ) : id = json['id'], desc = json['desc'], completed = json['completed'];
  //
  // Map<String, dynamic> toJson() =>
  //     {
  //       'id': id,
  //       'desc': desc,
  //       'completed': completed,};

}