import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';

class CheckListWidget extends StatefulWidget {
  const CheckListWidget({
  super.key, 
  required this.initialdata,
  required this.onChange,
  });
  final bool initialdata;
  final void Function(bool check) onChange;
  @override
  State<CheckListWidget> createState() => _CheckListWidgetState();
}

class _CheckListWidgetState extends State<CheckListWidget> {
  bool check = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      check = widget.initialdata;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            print(check);
            setState(() {
            check = !check;
            });
            widget.onChange(check);
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
                   check ? 'Done' : "Is Done",
                    style: TextStyle(
                      color: check ? Colors.green : Colors.black,
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
    );
  }
}
