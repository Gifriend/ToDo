import 'package:flutter/material.dart';
import 'package:todo/screen/home_screen.dart';
import 'package:todo/model/model.dart';

class AddScreen extends StatefulWidget {
  Todo? result;
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController addController = TextEditingController();
  Todo task = Todo(
  task: 'add', 
  isdone: false);
  Todo? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 26),
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Text(
                  'Add Todo',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: TextField(
              controller: addController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                  ),
                  hintText: 'What to do?'),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Container(
              height: 48,
              width: 45,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(48)),
              child: IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                onPressed: () {
                  result = Todo(task: addController.text, isdone: false, operation: 'save');
                  Navigator.pop(context, result);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
