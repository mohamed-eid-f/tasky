import '../repos/todo_repo.dart';

class DeleteTodoUsecase {
  final TodoRepo repository;
  DeleteTodoUsecase({
    required this.repository,
  });

  Future<String> call(String todoId) async {
    return await repository.deleteTodo(todoId);
  }
}
