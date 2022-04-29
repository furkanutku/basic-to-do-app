import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/models/tasks.dart';

class TaskData extends ChangeNotifier {
  final listKey = "list_key";
  final boolKey = "bool_key";

  List<Task> tasks = [
    // Task(name: "Unfinished tasks countesadr", isDone: true),
    // Task(name: "Shared Prefernces", isDone: false),
    // Task(name: "Push Notifications", isDone: false),
    // Task(name: "Settings Page", isDone: false)
  ];

  deleteTask(Task task) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks.remove(task);
    notifyListeners();
    saveData();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
    saveData();
  }

  String getTaskName(int index) {
    return tasks[index].name;
  }

  bool isTaskChecked(int index) {
    return tasks[index].isDone;
  }

  unCheckedTaskCount() {
    return tasks.where((task) => task.isDone == false).length;
  }

  get getIdxNum {
    for (int idx = 0; idx <= tasks.length; idx++) {
      if (tasks.isEmpty) {
        Task(name: "name");
      } else {
        return idx;
      }
      return idx;
    }
  }

  void addTask(Task task) {
    tasks.add(task);
    saveData();
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> spList =
        tasks.map((item) => json.encode(item.toMap())).toList();

    prefs.setStringList(listKey, spList);
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? spList = prefs.getStringList(listKey);

    var list = spList?.map((item) => Task.fromMap(json.decode(item))).toList();
    try {
      tasks = list!;
    } catch (e) {
      print(e);
    }
  }
}
//   List<String> get taskNames {
//     return tasks.map((e) => e.name).toList();
//   }

//   save(Task task) async {
//     final prefs = await SharedPreferences.getInstance();

//     if (task != null) {
//       prefs.setBool(task.name, task.isDone);
//       return;
//     }
//     final List<String> value = taskNames;
//     prefs.setStringList('task_list', value);

//     tasks.forEach((task) {
//       print('Save - ${task.name}: ${task.isDone}');
//       prefs.setBool(task.name, task.isDone);
//     });
//   }

//   void addTask(String name, {bool isDone = false, bool saveAfterAdd = true}) {
//     tasks.add(Task(name: name, isDone: isDone));
//     notifyListeners();
//     if (saveAfterAdd) {
//       save(tasks as Task);
//     }
//   }

//   load() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<String> task = prefs.getStringList('task_list') ?? [];

//     task.forEach((taskName) {
//       addTask(
//         taskName,
//         isDone: prefs.getBool(taskName) ?? false,
//         saveAfterAdd: false,
//       );
//     });
//     for (var element in tasks) {
//       print("Load ${element.name} :${element.isDone} ");
//     }
//   }
// }    


//   void remove(int index) {
//     tasks.removeAt(index);
//     notifyListeners();
//     save(tasks[index]);
//   }

//   List<String> get taskNames {
//     return tasks.map((e) => e.name).toList();
//   }

//   save(Task task) async {
//     final prefs = await SharedPreferences.getInstance();

//     if (task != null) {
//       prefs.setBool(task.name, task.isDone);
//       return;
//     }
//     final List<String> value = taskNames;
//     prefs.setStringList('task_list', value);

//     tasks.forEach((task) {
//       print('Save - ${task.name}: ${task.isDone}');
//       prefs.setBool(task.name, task.isDone);
//     });

  //   load() async {
  //     final prefs = await SharedPreferences.getInstance();
  //     final List<String> tasks = prefs.getStringList('task_list') ?? [];

  //     tasks.forEach((taskName) {
  //       addTask(
  //         taskName,
  //         isDone: prefs.getBool(taskName) ?? false,
  //         saveAfterAdd: false,
  //       );
  //     });
  //   }
  // }

  // void addTask(String name, {bool isDone = false, bool saveAfterAdd = true}) {
  //   tasks.add(Task(name: name, isDone: isDone));
  //   notifyListeners();
  //   if (saveAfterAdd) {
  //     save(tasks as Task);
  //   }
  // }

//   String getTaskName(int index) {
//     return tasks[index].name;
//   }

//   bool isTaskChecked(int index) {
//     return tasks[index].isDone;
//   }
// }

