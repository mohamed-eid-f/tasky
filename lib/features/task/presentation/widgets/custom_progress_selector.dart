import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';
import '../../domain/enum/task_progress_enum.dart';
import 'choose_progress_widget.dart';

class CustomProgressSelector extends StatefulWidget {
  const CustomProgressSelector({super.key});

  @override
  State<CustomProgressSelector> createState() => _CustomProgressSelectorState();
}

class _CustomProgressSelectorState extends State<CustomProgressSelector> {
  TaskProgressEnum _selectedTaskProgress = TaskProgressEnum.waiting;

  @override
  Widget build(BuildContext context) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)), //this right here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLargeTitle(title: "Select Task Progress"),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 200,
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectedTaskProgress = TaskProgressEnum.values[index];
                    });
                  },
                  child: ChooseProgressWidget(
                    progress: TaskProgressEnum.values[index],
                    isSelectable: true,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: TaskProgressEnum.values.length,
              ),
            ),
          ],
        ),
      ),
    );
    return InkWell(
      onTap: () {
        showDialog(
            context: context, builder: (BuildContext context) => errorDialog);
      },
      child: ChooseProgressWidget(
        progress: _selectedTaskProgress,
      ),
    );
  }
}
