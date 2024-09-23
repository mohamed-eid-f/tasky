import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:tasky/features/task/domain/usecases/get_all_todos_usecase.dart';

import '../../../domain/entity/todo.dart';

part 'all_todos_event.dart';
part 'all_todos_state.dart';

String stat = "";

class AllTodosBloc extends Bloc<AllTodosEvent, GetAllTodosState> {
  final GetAllTodosUsecase getAllTodosUsecase;

  AllTodosBloc({
    required this.getAllTodosUsecase,
  }) : super(const GetAllTodosState()) {
    on<AllTodosEvent>((event, emit) async {
      print("stat: $stat");
      if (event is GetAllTodosEvent) {
        if (state.hasReachedMax && stat == event.status) return;
        try {
          if (state.status == GetAllTodoStatus.loading) {
            stat = event.status;
            final todos =
                await getAllTodosUsecase(page: 1, status: event.status);
            return todos.length != 20
                ? emit(state.copyWith(
                    status: GetAllTodoStatus.success,
                    todos: todos,
                    hasReachedMax: true,
                  ))
                : emit(state.copyWith(
                    status: GetAllTodoStatus.success,
                    todos: todos,
                    hasReachedMax: false,
                  ));
          } else {
            int page = 1;
            if (stat == event.status) {
              page = (state.todos.length ~/ 20) + 1;
            }
            stat = event.status;
            final todos =
                await getAllTodosUsecase(page: page, status: event.status);
            if (page == 1) {
              if (todos.length != 20) {
                emit(state.copyWith(
                  status: GetAllTodoStatus.success,
                  todos: todos,
                  hasReachedMax: true,
                ));
              } else {
                emit(state.copyWith(
                  status: GetAllTodoStatus.success,
                  todos: todos,
                  hasReachedMax: false,
                ));
              }
            } else {
              if (todos.length != 20) {
                emit(state.copyWith(
                  status: GetAllTodoStatus.success,
                  todos: List.of(state.todos)..addAll(todos),
                  hasReachedMax: true,
                ));
              } else {
                emit(state.copyWith(
                  status: GetAllTodoStatus.success,
                  todos: List.of(state.todos)..addAll(todos),
                  hasReachedMax: false,
                ));
              }
            }
          }
        } catch (e) {
          emit(
            state.copyWith(
              status: GetAllTodoStatus.error,
              errorMessage: "failed to fetch data \n${e.toString()}",
            ),
          );
        }
      }
    }, transformer: restartable());
  }
}
