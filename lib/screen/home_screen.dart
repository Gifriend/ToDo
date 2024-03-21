import 'package:flutter/material.dart';
import 'package:todo/model/operation_enum.dart';
import 'package:todo/screen/widgets/add_edit.dart';
import 'widgets/task_container_widget.dart';
import 'package:todo/model/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDoList = [];

  void _navigateEdit({Todo? todo, int index = 0}) async {
    Todo? result;
    result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditScreen(
          initialdata: todo,
        ),
      ),
    );

    if (result!.operation == OperationEnum.delete) {
      setState(
        () {
          toDoList.removeAt(index);
        },
      );
      return;
    } if (result.operation == OperationEnum.add) {
      setState(
        () {
          toDoList.add(result);
        },
      );
      return;
    } if (result.operation == OperationEnum.update) {
      setState(
        () {
          toDoList.removeAt(index);
          toDoList.insert(index, result);
        },
      );
      return;
    }
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 26),
            height: 72,
            width: 342,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2),
                color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add ToDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                  icon: Icon(Icons.add_circle_outline),
                  color: Colors.white,
                  onPressed:  _navigateEdit,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: 400,
            height: 300,
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                Todo todo = toDoList[index];
                return TaskContainerWidget(
                  onPressed: () => _navigateEdit(todo : todo, index : index ),
                  todoText: todo,
                );
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
