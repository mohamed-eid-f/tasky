import 'dart:io';

import 'package:http_parser/http_parser.dart';

import '../../domain/entity/todo.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tasky/core/storage/secure_storage.dart';

import '../../../../core/consts/consts.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/todo_model.dart';

abstract class TodoDataSource {
  Future<List<Todo>> getTodos(int page);
  Future<String> uploadImage(File todoImg);
  Future<Todo> createTodo(Todo todo);
  Future<Todo> getTodo(String todoId);
  Future<Todo> updateTodo(Todo todo);
  Future<String> deleteTodo(String todoId);
}

class TodoDataSourceWithHttp implements TodoDataSource {
  final http.Client client;
  TodoDataSourceWithHttp({required this.client});

  @override
  Future<String> uploadImage(File todoImg) async {
    final token = await const SecureStorage().readValue(key: kAccessToken);
    final Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('$kBaseUrl/upload/image'));
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        todoImg.path,
        filename: todoImg.path.split('/').last,
        contentType: MediaType('image', 'jpg'),
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 201) {
      return '${result["image"]}';
    } else if (response.statusCode == 422) {
      throw (UnProcessableException(jsonDecode(response.body)["message"])
        ..printError());
    } else if (response.statusCode == 401) {
      throw (UnAuthorizedException);
    } else {
      throw UnhandledException(response.statusCode, response.body)
        ..printError();
    }
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    final Map<String, dynamic> body = {
      "image": todo.image,
      "title": todo.title,
      "desc": todo.desc,
      "priority": todo.priority,
      "dueDate": todo.dueDate,
    };
    final token = await const SecureStorage().readValue(key: kAccessToken);

    final Map<String, String> headers = {"Authorization": "Bearer $token"};

    final response = await client.post(
      Uri.parse("$kBaseUrl/todos"),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 201) {
      return Future.value(TodoModel.fromJson(json.decode(response.body)));
    } else {
      throw UnhandledException(response.statusCode, response.body)
        ..printError();
    }
  }

  @override
  Future<String> deleteTodo(String todoId) async {
    final token = await const SecureStorage().readValue(key: kAccessToken);

    final Map<String, String> headers = {"Authorization": "Bearer $token"};

    final response = await client.delete(
      Uri.parse('$kBaseUrl/todos/$todoId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Future.value(response.body);
    } else {
      throw UnhandledException(response.statusCode, response.body)
        ..printError();
    }
  }

  @override
  Future<Todo> getTodo(String todoId) async {
    final token = await const SecureStorage().readValue(key: kAccessToken);

    final Map<String, String> headers = {"Authorization": "Bearer $token"};

    final response = await client.get(
      Uri.parse('$kBaseUrl/todos/$todoId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Future.value(TodoModel.fromJson(jsonDecode(response.body)));
    } else {
      throw UnhandledException(response.statusCode, response.body)
        ..printError();
    }
  }

  @override
  Future<List<Todo>> getTodos(page) async {
    String url = "$kBaseUrl/todos?page=$page";
    final token = await const SecureStorage().readValue(key: kAccessToken);

    final Map<String, String> headers = {"Authorization": "Bearer $token"};

    var response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      List<Todo> todos = decodedJson
          .map<Todo>((jsonTodoModel) => TodoModel.fromJson(jsonTodoModel))
          .toList();
      return todos;
    } else {
      throw UnhandledException(response.statusCode, response.body)
        ..printError();
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    final Map<String, dynamic> body = {
      "image": todo.image,
      "title": todo.title,
      "desc": todo.desc,
      "priority": todo.priority,
      "dueDate": todo.dueDate,
      "user": todo.user,
    };
    final token = await const SecureStorage().readValue(key: kAccessToken);

    final Map<String, String> headers = {"Authorization": "Bearer $token"};

    final response = await client.put(
      Uri.parse("$kBaseUrl/todos"),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Future.value(TodoModel.fromJson(json.decode(response.body)));
    } else {
      throw UnhandledException(response.statusCode, response.body);
    }
  }
}
