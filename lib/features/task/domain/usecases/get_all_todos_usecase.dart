import '../entity/todo.dart';
import '../repos/todo_repo.dart';

class GetAllTodosUsecase {
  final TodoRepo repository;
  GetAllTodosUsecase({
    required this.repository,
  });

  Future<List<Todo>> call({int page = 1, String status = "all"}) async {
    return await repository.getAllTodos(page, status);
  }
}
