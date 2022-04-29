import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task_data.dart';
import 'package:task_app/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var color;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(color),
      ),
    );
  }
}
