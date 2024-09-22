import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Todo extends Equatable {
  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? dueDate;
  String? user;
  String? createdAt;
  String? updatedAt;
  Todo({
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.dueDate,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        title,
        desc,
        priority,
        status,
        dueDate,
        user,
        createdAt,
        updatedAt,
      ];
}
