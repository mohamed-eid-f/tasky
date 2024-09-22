import '../entity/todo.dart';
import '../repos/todo_repo.dart';

class GetAllTodosUsecase {
  final TodoRepo repository;
  GetAllTodosUsecase({
    required this.repository,
  });

  Future<List<Todo>> call([int page = 1]) async {
    return await repository.getAllTodos(page);
  }
}
