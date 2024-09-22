import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/entity/todo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/internet_info.dart';
import '../../domain/repos/todo_repo.dart';
import '../datasources/todo_data_source.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoDataSource todoDataSource;
  final InternetInfo internetInfo;

  TodoRepoImpl({required this.todoDataSource, required this.internetInfo});

  @override
  Future<Todo> createTodo(Todo todo, String todoImgPath) async {
    if (await internetInfo.isConnected) {
      try {
        String image = await todoDataSource.uploadImage(File(todoImgPath));
        todo.image = image;
        debugPrint("TODO : $todo");
        Todo newTodo = await todoDataSource.createTodo(todo);
        return newTodo;
      } catch (e) {
        rethrow;
      }
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<String> deleteTodo(String todoId) async {
    if (await internetInfo.isConnected) {
      try {
        final todo = await todoDataSource.deleteTodo(todoId);
        return todo;
      } catch (e) {
        rethrow;
      }
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<Todo> editTodo(Todo todo) async {
    if (await internetInfo.isConnected) {
      try {
        final updatedTodo = await todoDataSource.updateTodo(todo);
        return updatedTodo;
      } catch (e) {
        rethrow;
      }
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<List<Todo>> getAllTodos(int page) async {
    if (await internetInfo.isConnected) {
      try {
        final todos = await todoDataSource.getTodos(page);
        return todos;
      } catch (e) {
        rethrow;
      }
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<Todo> getOneTodo(String todoId) async {
    if (await internetInfo.isConnected) {
      try {
        final todo = await todoDataSource.getTodo(todoId);
        return todo;
      } catch (e) {
        rethrow;
      }
    } else {
      throw OfflineException();
    }
  }
}
