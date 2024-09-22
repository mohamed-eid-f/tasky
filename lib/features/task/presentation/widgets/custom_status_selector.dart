import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';
import '../../domain/enum/todo_status_enum.dart';
import 'choose_status_widget.dart';

class CustomStatusSelector extends StatefulWidget {
  const CustomStatusSelector(this.status, {super.key});
  final String status;

  @override
  State<CustomStatusSelector> createState() => _CustomStatusSelectorState();
}

class _CustomStatusSelectorState extends State<CustomStatusSelector> {
  TodoStatusEnum _selectedTodoStatus = TodoStatusEnum.waiting;

  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case 'inProgress':
        _selectedTodoStatus = TodoStatusEnum.inProgress;
        break;
      case 'finished':
        _selectedTodoStatus = TodoStatusEnum.finished;
        break;
    }
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)), //this right here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLargeTitle(title: "Select Todo Status"),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 200,
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectedTodoStatus = TodoStatusEnum.values[index];
                    });
                  },
                  child: ChooseStatusWidget(
                    status: TodoStatusEnum.values[index],
                    isSelectable: true,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: TodoStatusEnum.values.length,
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
      child: ChooseStatusWidget(
        status: _selectedTodoStatus,
      ),
    );
  }
}
