import 'package:todo/model/operation_enum.dart';

class Todo {
  String task;
  bool isdone;
  OperationEnum operation;
  Todo({
    required this.task,
    required this.isdone,
    this.operation=OperationEnum.add
  });
}
