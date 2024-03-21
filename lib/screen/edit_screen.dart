import 'package:flutter/material.dart';
import 'package:todo/screen/home_screen.dart';
import 'package:todo/screen/add_screen.dart';
import 'package:todo/model/model.dart';

class EditScreen extends StatefulWidget {
  Todo? result;

  final String initialData;
  // final Function(Todo) onSave;
  // final void Function() onDelete;

  EditScreen({
    required this.initialData,
    // required this.onDelete
    });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

Todo task = Todo(task: 'edit', isdone: false);
Todo? result;

class _EditScreenState extends State<EditScreen> {
  TextEditingController _editTextController = TextEditingController();

int selectedIndex = -1;
final String result2= 'jambu';


  @override
  void initState() {
    super.initState();
    setState(() {
      _editTextController.text = widget.initialData;
    });
  }



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
                  'Edit Todo',
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
              controller: _editTextController,
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
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  result = Todo(task: _editTextController.text, isdone: true);
                  Navigator.pop(context, result);
                },
                child: Container(
                  width: 132,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        size: 24,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Text(
                          'Is Done',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 93),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(48)),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed:  () {
                        // Navigator.pop(context);
                        // widget.onDelete();
                         result =
                            Todo(task: '', isdone: false, operation: 'delete');
                        Navigator.pop(context,  result);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 93),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(48)),
                    child: IconButton(
                      icon: Icon(Icons.check),
                      color: Colors.white,
                      onPressed: () {
                        result =
                            Todo(task: _editTextController.text, isdone: false);
                        Navigator.pop(context,  result);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
