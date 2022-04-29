import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/models/task_data.dart';
import 'package:task_app/screens/settins.dart';
import 'package:task_app/screens/task_screen.dart';

class PickColor extends StatefulWidget {
  var selectedColor;
  PickColor(this.selectedColor);
  @override
  State<PickColor> createState() => _PickColorState();
}

class _PickColorState extends State<PickColor> {
  void initState() {
    initSharedPrefernces();
    super.initState();
  }

  initSharedPrefernces() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color', widget.selectedColor.hashCode);
    var clr = prefs.getInt('color');
    print(clr);
    setState(() {});
  }

  List<Color> colors = [
    Colors.lightBlueAccent,
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.brown
  ];

  void changeColor(int index) {
    widget.selectedColor = colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Change Color"),
          centerTitle: true,
          backgroundColor: widget.selectedColor,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Settings(widget.selectedColor)));
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          )),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0, left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                for (var idx = 0; idx == 0; idx++) {
                  setState(() {
                    widget.selectedColor = colors[idx];
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                for (var idx = 1; idx == 1; idx++) {
                  setState(() {
                    widget.selectedColor = colors[idx];
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                for (var idx = 2; idx == 2; idx++) {
                  setState(() {
                    widget.selectedColor = colors[idx];
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                for (var idx = 3; idx == 3; idx++) {
                  setState(() {
                    widget.selectedColor = colors[idx];
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                for (var idx = 4; idx == 4; idx++) {
                  setState(() {
                    widget.selectedColor = colors[idx];
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                for (var idx = 5; idx == 5; idx++) {
                  setState(() {
                    widget.selectedColor = colors[idx];
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.brown,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  initSharedPrefernces();
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }
}






















// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:task_app/screens/settins.dart';

// class PickColor extends StatefulWidget {
//   final Function changeColor;
//   bool selectedColor = false;

//   PickColor({required this.changeColor});
//   @override
//   State<PickColor> createState() => _PickColorState();
// }

// class _PickColorState extends State<PickColor> {
//   Color currentColor = Colors.blue;

//   void changeColor(Color color) => setState(() {
//         widget.selectedColor = true;
//         if (widget.selectedColor) {
//           currentColor = color;
//         } else {
//           currentColor = Colors.blue;
//         }
//       });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//           ),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => Settings(currentColor)));
//             print(currentColor);
//           },
//         ),
//         title: const Text('Change Color'),
//         backgroundColor: widget.selectedColor ? currentColor : Colors.blue,
//         centerTitle: true,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: BlockPicker(
//             pickerColor: widget.selectedColor ? currentColor : Colors.blue,
//             onColorChanged: (newColor) {
//               changeColor(newColor);
//             }),
//       ),
//     );
//   }
// }
