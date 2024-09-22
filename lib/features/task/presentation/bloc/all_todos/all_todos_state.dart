part of 'all_todos_bloc.dart';

enum GetAllTodoStatus { loading, success, error }

class GetAllTodosState extends Equatable {
  final GetAllTodoStatus status;
  final List<Todo> todos;
  final String errorMessage;
  final bool hasReachedMax;

  const GetAllTodosState({
    this.status = GetAllTodoStatus.loading,
    this.todos = const [],
    this.errorMessage = '',
    this.hasReachedMax = false,
  });

  GetAllTodosState copyWith({
    GetAllTodoStatus? status,
    List<Todo>? todos,
    String? errorMessage,
    bool? hasReachedMax,
  }) {
    return GetAllTodosState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        status,
        todos,
        errorMessage,
        hasReachedMax,
      ];
}
