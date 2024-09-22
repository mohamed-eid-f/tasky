import '../entity/todo.dart';
import '../repos/todo_repo.dart';

class EditTodoUsecase {
  final TodoRepo repository;
  EditTodoUsecase({
    required this.repository,
  });

  Future<Todo> call(Todo todo) async {
    return await repository.editTodo(todo);
  }
}
