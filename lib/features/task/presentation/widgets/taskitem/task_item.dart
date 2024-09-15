import 'package:flutter/material.dart';
import 'package:tasky/features/task/presentation/pages/task_details_screen.dart';
import 'package:tasky/features/task/presentation/widgets/taskitem/taskitem_priority_widget.dart';

import '../../../domain/enum/task_priority_enum.dart';
import '../../../domain/enum/task_progress_enum.dart';
import 'taskitem_progress_widget.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TaskDetailsScreen(),
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
            const CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(
                'assets/images/list_image.png',
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          "Grocery Shopping App",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const Spacer(),
                      const TaskProgressWidget(
                          taskProgressEnum: TaskProgressEnum.finished),
                    ],
                  ),
                  const Text(
                    "This application is designed for super shops. By using",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Row(
                    children: [
                      TaskPriorityWidget(
                        priority: TaskPriorityEnum.low,
                      ),
                      Spacer(),
                      Text("30/12/2022"),
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
