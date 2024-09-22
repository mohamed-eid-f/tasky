import '../entity/todo.dart';

abstract class TodoRepo {
  Future<List<Todo>> getAllTodos(int page);
  Future<Todo> getOneTodo(String todoId);
  Future<Todo> createTodo(Todo todo, String imgPath);
  Future<Todo> editTodo(Todo todo);
  Future<String> deleteTodo(String todoId);
}
