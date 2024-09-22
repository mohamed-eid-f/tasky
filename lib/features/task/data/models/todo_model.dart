import 'package:tasky/features/task/domain/entity/todo.dart';

// ignore: must_be_immutable
class TodoModel extends Todo {
  TodoModel({
    super.id,
    super.image,
    super.title,
    super.desc,
    super.priority,
    super.status,
    super.dueDate,
    super.user,
    super.createdAt,
    super.updatedAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['_id'],
        image: json['image'],
        title: json['title'],
        desc: json['desc'],
        priority: json['priority'],
        status: json['status'],
        dueDate: json['dueDate'],
        user: json['user'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
  factory TodoModel.fromEntity(Todo todo) => TodoModel(
        id: todo.id,
        image: todo.image,
        title: todo.title,
        desc: todo.desc,
        priority: todo.priority,
        status: todo.status,
        dueDate: todo.dueDate,
        user: todo.user,
        createdAt: todo.createdAt,
        updatedAt: todo.updatedAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'title': title,
        'desc': desc,
        'priority': priority,
        'status': status,
        'dueDate': dueDate,
        'user': user,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
