import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:tasky/features/task/domain/entity/todo.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/presentation/widgets/loading_widget.dart';
import '../../../auth/presentation/widgets/app_large_title.dart';
import '../../../auth/presentation/widgets/app_small_title.dart';
import '../bloc/todos/todos_bloc.dart';
import '../widgets/custom_date_selector.dart';
import '../widgets/custom_details_appbar.dart';
import '../widgets/custom_priority_selector.dart';
import '../widgets/custom_status_selector.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({
    super.key,
    required this.todoId,
  });
  final String todoId;
  @override
  Widget build(BuildContext context) {
    context.read<TodosBloc>().add(GetOneTodoEvent(todoId: todoId));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomDetailsAppbar(),
              Expanded(
                child: BlocBuilder<TodosBloc, TodosState>(
                  builder: (context, state) {
                    if (state is TodoLoadingState) {
                      return const LoadingWidget();
                    } else if (state is TodoSuccessState) {
                      Todo todo = state.todo!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 225,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: todo.image == null
                                  ? Image.asset(
                                      kDefaultImage,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "$kImagesUrl/${todo.image!}",
                                      fit: BoxFit.fitWidth,
                                    ),
                            ),
                            const SizedBox(height: 16),
                            AppLargeTitle(title: todo.title!),
                            AppSmallTitle(title: todo.desc!),
                            const SizedBox(height: 16),
                            CustomDatePicker(
                              titleText: todo.dueDate ?? "no date",
                              subTitleText: "End Date",
                              backgroundColor: AppColors.secondary,
                            ),
                            const SizedBox(height: 8),
                            CustomStatusSelector(todo.status!),
                            const SizedBox(height: 8),
                            CustomPrioritySelector(priority: todo.priority!),
                            const SizedBox(height: 16),
                            Image.asset(
                              'assets/images/qr.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
