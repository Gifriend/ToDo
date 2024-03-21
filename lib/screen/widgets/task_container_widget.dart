import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';

class TaskContainerWidget extends StatelessWidget {
  TaskContainerWidget({
    super.key,
    required this.todoText,
    required this.onPressed
  });

  final Todo todoText;
  final void Function() onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
              height: 72,
              width: 342,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(todoText.isdone ? Icons.check : Icons.remove),
                  Expanded(
                    child: Text(todoText.task,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          decoration: todoText.isdone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        )),
                  ),
                  IconButton(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                    icon: Icon(Icons.edit),
                    color: Colors.black,
                    onPressed: (){
                      onPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
