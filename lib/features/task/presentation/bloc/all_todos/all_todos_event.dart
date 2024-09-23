part of 'all_todos_bloc.dart';

sealed class AllTodosEvent extends Equatable {
  const AllTodosEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodosEvent extends AllTodosEvent {
  final String status;

  const GetAllTodosEvent(this.status);
  @override
  List<Object> get props => [status];
}
