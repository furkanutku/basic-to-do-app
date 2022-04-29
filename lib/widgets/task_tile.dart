import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String? taskTitle;
  final Function checkBoxValue;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkBoxValue,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.black,
        value: isChecked,
        onChanged: (newValue) {
          checkBoxValue(newValue);
        },
      ),
    );
  }
}






//Tek stateful widget ve callbacksiz ile aşağıdaki şekilde

// class TaskTile extends StatefulWidget {
//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }
// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       trailing: Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: isChecked,
//       onChanged: (newValue){
//         setState(() {
//            isChecked = newValue!;
//         });
//  
//       },
//     ),
//       title: Text(
//         "Enter a value for task",
//         style: TextStyle(
//             decoration: isChecked ? TextDecoration.lineThrough : null),
//       ),
//     );
//   }
// }

