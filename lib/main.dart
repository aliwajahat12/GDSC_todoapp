import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TODO App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initialzing text editing controller by the name of todoController which will controll
  // the text we enter in the text form field
  TextEditingController todoController = TextEditingController();

  // Initilaizing the list in which all the tasks will be added
  List<String> todo = [];

  // Function to add task in the list
  void _addTask() {
    // Using Set State so that the widget rebuilds
    setState(() {
      todo.add(todoController.text);
      todoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // Using row because the add icon was on the right of text field.
            child: Row(
              children: [
                // Expanded takes all the available space
                Expanded(
                  // Text Field takes the input
                  child: TextField(
                    controller: todoController,
                  ),
                ),

                //Button which adds the task to the list
                IconButton(
                    onPressed: _addTask,
                    icon: Icon(Icons.add, color: Colors.red)),
              ],
            ),
          ),

          // Expanded takes all the available space vertically in the screen because it
          // is in the Column
          Expanded(
            // We use ListView.builder when the length of children are dynamic (not constant)
            child: ListView.builder(
              // item count takes the length of the list.
              // todo is the list we defined above. todo.length gives the number of elements
              // in the list
              itemCount: todo.length,

              // builder takes the context and integer i, same as in the loop and should return
              // a widget (Container, Text, ListTile etc.)
              itemBuilder: (context, i) {
                return Text(todo[i]);
              },
            ),
          )
        ],
      ),
    );
  }
}
