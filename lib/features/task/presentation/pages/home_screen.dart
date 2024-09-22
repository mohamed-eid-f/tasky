import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/presentation/widgets/loading_widget.dart';
import 'package:tasky/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:tasky/features/auth/presentation/pages/login_screen.dart';
import 'package:tasky/features/auth/presentation/widgets/app_small_title.dart';
import 'package:tasky/features/task/presentation/pages/add_new_task_screen.dart';
import 'package:tasky/features/task/presentation/widgets/custom_home_appbar.dart';
import 'package:tasky/features/task/presentation/widgets/floating_buttons.dart';
import 'package:tasky/features/task/presentation/widgets/todoitem/todo_item.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/utils/show_dialog.dart';
import '../bloc/all_todos/all_todos_bloc.dart';
import '../widgets/chips_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.8)) {
      context.read<AllTodosBloc>().add(GetAllTodosEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<AllTodosBloc>().add(GetAllTodosEvent());

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomHomeAppbar(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: AppSmallTitle(title: "My Tasks"),
            ),
            const SizedBox(height: 56, child: ChipsSelector()),
            Expanded(
              child: BlocConsumer<AllTodosBloc, GetAllTodosState>(
                listener: (context, state) {
                  switch (state.status) {
                    case GetAllTodoStatus.loading:
                      ShowDialog(context).showLoadingDialog();
                      break;
                    case GetAllTodoStatus.success:
                      if (state.todos.isEmpty) {
                        ShowDialog(context)
                            .showWidget(const Text("No tasks found"));
                      }
                      break;
                    case GetAllTodoStatus.error:
                      ShowDialog(context)
                          .showErrorDialog(message: state.errorMessage);
                      break;
                  }
                },
                builder: (context, state) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.todos.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TodoItem(
                        todo: state.todos[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingButtons(),
    );
  }
}
