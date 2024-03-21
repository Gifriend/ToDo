import 'package:flutter/material.dart';

class Skip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
                  child: 
                  Text('ADD ToDo',
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,),
                  ),
                ),
              ),
              
            ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                  ),
                  hintText: 'What to do?'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
            height: 72,
            width: 342,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Some Todo',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                   child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Hello World'),
                    trailing: Icon(Icons.add_circle_outline_outlined),
                   ),
                ),
              ],
            ),
          ),
          ],
        ),
        
      ),
    );
  }
}