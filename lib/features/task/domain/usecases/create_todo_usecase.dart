import '../entity/todo.dart';
import '../repos/todo_repo.dart';

class CreateTodoUsecase {
  final TodoRepo repository;
  CreateTodoUsecase({
    required this.repository,
  });

  Future<Todo> call(Todo todo, String imagePath) async {
    return await repository.createTodo(todo, imagePath);
  }
}
