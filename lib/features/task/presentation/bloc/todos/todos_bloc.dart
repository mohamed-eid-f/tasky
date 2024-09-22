import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasky/features/task/domain/usecases/create_todo_usecase.dart';
import 'package:tasky/features/task/domain/usecases/delete_todo_usecase.dart';
import 'package:tasky/features/task/domain/usecases/edit_todo_usecase.dart';
import 'package:tasky/features/task/domain/usecases/get_one_todo_usecase.dart';

import '../../../domain/entity/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final EditTodoUsecase editTodoUsecase;
  final CreateTodoUsecase createTodoUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;
  final GetOneTodoUsecase getOneTodoUsecase;

  TodosBloc({
    required this.editTodoUsecase,
    required this.createTodoUsecase,
    required this.deleteTodoUsecase,
    required this.getOneTodoUsecase,
  }) : super(TodoInitialState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetOneTodoEvent) {
        emit(TodoLoadingState());
        try {
          final todo = await getOneTodoUsecase(event.todoId);
          emit(TodoSuccessState(todo: todo));
        } catch (e) {
          emit(TodoFailureState(message: e.toString()));
        }
      } else if (event is CreateTodoEvent) {
        emit(TodoLoadingState());
        try {
          final todo = await createTodoUsecase(event.todo, event.imgPath!);
          emit(TodoSuccessState(todo: todo));
        } catch (e) {
          emit(TodoFailureState(message: e.toString()));
        }
      } else if (event is EditTodoEvent) {
        emit(TodoLoadingState());
        try {
          final todo = await editTodoUsecase(event.todo);
          emit(TodoSuccessState(todo: todo));
        } catch (e) {
          emit(TodoFailureState(message: e.toString()));
        }
      } else if (event is DeleteTodoEvent) {
        emit(TodoLoadingState());
        try {
          final result = await deleteTodoUsecase(event.todoId);
          emit(TodoSuccessState(result: result));
        } catch (e) {
          emit(TodoFailureState(message: e.toString()));
        }
      }
    });
  }
}
