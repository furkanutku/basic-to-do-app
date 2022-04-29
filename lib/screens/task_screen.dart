import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:task_app/models/tasks.dart';
import 'package:task_app/screens/settins.dart';
import 'package:task_app/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:task_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  var color;
  TasksScreen(this.color);
  @override
  State<TasksScreen> createState() => _TasksScreenState();
  final listKey = "list_key";
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    initSharedPrefernces();

    super.initState();
  }

  initSharedPrefernces() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color', widget.color.hashCode);
    prefs.getInt('color');
    Provider.of<TaskData>(context, listen: false).loadData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskData>(context).tasks;

    return Consumer<TaskData>(builder: ((context, value, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: false,
                context: context,
                builder: (context) => AddTaskScreen(
                      addTasksCallBack: (newTaskTitle) {
                        setState(
                          () {
                            try {
                              value.addTask(Task(name: newTaskTitle));
                            } catch (e) {
                              print(e);
                            }
                          },
                        );

                        Navigator.pop(context);
                      },
                      color: widget.color,
                    ));
          },
          backgroundColor: widget.color ?? Colors.blue,
          child: const Icon(
            Icons.add,
          ),
        ),
        backgroundColor: widget.color ?? Colors.blue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.grey,
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: InkWell(
                          onTap: () {
                            print(widget.color.hashCode);
                          },
                          child: Icon(
                            Icons.list,
                            size: 30.0,
                            color: widget.color,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        radius: 30.0,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Settings(widget.color)));
                          },
                          icon: const Icon(
                            Icons.settings,
                            size: 30,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Fo-Do",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${task.length} Task",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  task.isNotEmpty
                      ? Text(
                          value.unCheckedTaskCount() == 0
                              ? "All tasks completed \u{2713} \u{2713} "
                              : "${value.unCheckedTaskCount()} unfinished task",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                        )
                      : const SizedBox(
                          height: 0.0,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                child: task.isEmpty
                    ? const Center(
                        child: Text(
                          "Click \u{2795} button to add task",
                          style: TextStyle(),
                        ),
                      )
                    : TaskList(),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
