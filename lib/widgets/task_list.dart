import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/models/task_data.dart';
import 'package:task_app/widgets/task_tile.dart';
import 'package:task_app/models/tasks.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        final task = taskData.tasks;
        Task tasks;
        return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Colors.lightBlueAccent,
                  child: const Center(
                      child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
                ),
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  taskData.deleteTask(task[index]);
                },
                child: TaskTile(
                    isChecked: task[index].isDone,
                    taskTitle: task[index].name,
                    checkBoxValue: (bool chechBoxState) {
                      taskData.updateTask(task[index]);
                    }),
              );
            });
      },
    );
  }
}
