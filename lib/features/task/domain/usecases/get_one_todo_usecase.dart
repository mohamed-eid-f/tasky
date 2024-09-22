import '../entity/todo.dart';
import '../repos/todo_repo.dart';

class GetOneTodoUsecase {
  final TodoRepo repository;
  GetOneTodoUsecase({
    required this.repository,
  });

  Future<Todo> call(String todoId) async {
    return await repository.getOneTodo(todoId);
  }
}
