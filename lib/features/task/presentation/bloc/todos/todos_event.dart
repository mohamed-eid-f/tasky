part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetOneTodoEvent extends TodosEvent {
  final String todoId;
  const GetOneTodoEvent({
    required this.todoId,
  });
  @override
  List<Object> get props => [todoId];
}

class CreateTodoEvent extends TodosEvent {
  final Todo todo;
  final String? imgPath;

  const CreateTodoEvent({required this.todo, required this.imgPath});
  @override
  List<Object> get props => [todo, imgPath!];
}

class EditTodoEvent extends TodosEvent {
  final Todo todo;
  const EditTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends TodosEvent {
  final String todoId;
  const DeleteTodoEvent({
    required this.todoId,
  });
  @override
  List<Object> get props => [todoId];
}
