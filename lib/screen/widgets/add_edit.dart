import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';
import 'package:todo/model/operation_enum.dart';
import 'package:todo/screen/widgets/checklist.dart';

class AddEditScreen extends StatefulWidget {
  final Todo? initialdata;
  AddEditScreen({required this.initialdata});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  TextEditingController addController = TextEditingController();
  Todo? result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(
      () {
        addController.text = widget.initialdata?.task ?? '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isadd = widget.initialdata == null;
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
                  isadd ? 'Add Todo' : 'Edit Todo',
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
          isadd
              ? Expanded(
                  child: SizedBox(),
                )
              : Padding(padding: const EdgeInsets.only(right: 48)),
          isadd
              ? Padding(
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
                        result = Todo(
                            task: addController.text,
                            isdone: false,
                            operation: OperationEnum.add);
                        Navigator.pop(context, result);
                      },
                    ),
                  ),
                )
              : SizedBox(),
          isadd
              ? SizedBox()
              : SizedBox(
                  child: CheckListWidget(
                    initialdata: widget.initialdata?.isdone ?? false,
                    onChange: (check) {
                      result = Todo(
                          task: addController.text,
                          isdone: check,
                          operation: OperationEnum.update);
                      Navigator.pop(context, result);
                    },
                  ),
                ),
          Expanded(
            child: SizedBox(),
          ),
          isadd
              ? SizedBox()
              : Padding(
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
                            onPressed: () {
                              result = Todo(
                                  task: addController.text,
                                  isdone: false,
                                  operation: OperationEnum.delete);
                              Navigator.pop(context, result);
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
                              result = Todo(
                                  task: addController.text,
                                  isdone: false,
                                  operation: OperationEnum.update);
                              Navigator.pop(context, result);
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
