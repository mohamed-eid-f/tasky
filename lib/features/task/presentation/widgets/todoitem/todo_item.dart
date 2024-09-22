import 'package:flutter/material.dart';
import 'package:tasky/features/task/presentation/pages/task_details_screen.dart';
import 'package:tasky/features/task/presentation/widgets/todoitem/todoitem_priority_widget.dart';

import '../../../../../core/consts/consts.dart';
import '../../../domain/entity/todo.dart';
import 'todoitem_progress_widget.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TaskDetailsScreen(todoId: todo.id!),
          ),
        );
      },
      child: Container(
        height: 120.0,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: todo.image != null
                  ? NetworkImage(
                      "$kImagesUrl/${todo.image!}",
                    )
                  : const AssetImage(kDefaultImage),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          todo.title ?? "No Title",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const Spacer(),
                      TodoStatusWidget(status: todo.status ?? "waiting"),
                    ],
                  ),
                  Text(
                    todo.desc ?? "No Description",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      TodoPriorityWidget(
                        priority: todo.priority ?? "low",
                      ),
                      const Spacer(),
                      Text(
                        todo.dueDate ?? "No Date",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
