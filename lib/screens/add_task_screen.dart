import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTasksCallBack;
  var color;

  AddTaskScreen({required this.addTasksCallBack, required this.color});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? _textFieldValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Column(
            children: [
              Text(
                "Add Task",
                style: TextStyle(fontSize: 25, color: widget.color),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Add to Task"),
                autofocus: false,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _textFieldValue = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    widget.addTasksCallBack(
                      _textFieldValue,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    child: const Center(
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    decoration:
                        BoxDecoration(color: widget.color ?? Colors.blue),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
