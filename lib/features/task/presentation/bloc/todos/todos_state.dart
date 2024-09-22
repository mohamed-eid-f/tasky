part of 'todos_bloc.dart';

sealed class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

final class TodoInitialState extends TodosState {}

final class TodoLoadingState extends TodosState {}

final class TodoFailureState extends TodosState {
  final String message;

  const TodoFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

final class TodoSuccessState extends TodosState {
  final String? result;
  final Todo? todo;

  const TodoSuccessState({this.result, this.todo});
}
