import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final myBox = Hive.box('myBox');
  ToDoDatabase toDoDatabase = ToDoDatabase();

  @override
  void initState() {
    super.initState();

    if (myBox.get('TODOLIST') != null) {
      // data already exists
      toDoDatabase.loadData();
    }
  }

  // text controller
  final controller = TextEditingController();

  // checkBox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoDatabase.toDoList[index][1] = !toDoDatabase.toDoList[index][1];
    });
    toDoDatabase.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      if (controller.text.isEmpty) {
        Navigator.of(context).pop();
        // include a toast
        Fluttertoast.showToast(
          msg: 'Nothing to add',
          fontSize: 15.0,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.blue,
        );
      } else {
        Navigator.of(context).pop();
        toDoDatabase.toDoList.add([controller.text, false]);
        // include a toast
        Fluttertoast.showToast(
          msg: 'Added Successfully',
          fontSize: 18.0,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.blue,
        );
        controller.clear();
      }
    });
    toDoDatabase.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () {
              setState(() {
                controller.clear();
                Navigator.of(context).pop();
              });
            },
          );
        });
    toDoDatabase.updateDataBase();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoDatabase.toDoList.removeAt(index);
    });
    toDoDatabase.updateDataBase();
  }

  // undo delete
  undoDelete(index, item) {
    setState(() {
      toDoDatabase.toDoList.insert(index, item);
    });
    toDoDatabase.updateDataBase();
  }

  bool emptyToDoList() {
    return toDoDatabase.toDoList.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text('TO DO LIST'),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
      body: Builder(builder: (context) {
        return emptyToDoList()
            ? const Center(
                child: Text(
                  'No task added ',
                  style: TextStyle(fontSize: 20, fontFamily: 'San Francisco'),
                ),
              )
            : ListView.builder(
                itemCount: toDoDatabase.toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    taskName: toDoDatabase.toDoList[index][0],
                    taskCompleted: toDoDatabase.toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) {
                      setState(() {
                        var item = toDoDatabase.toDoList[index];
                        deleteTask(index);
                        // show a snackbar
                        showActionSnackBar(context, item, index);
                      });
                    },
                  );
                });
      }),
    );
  }

  void showActionSnackBar(context, item, index) {
    final snackBar = SnackBar(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.black),
      ),
      padding: const EdgeInsets.all(15.0),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      duration: const Duration(seconds: 1),
      content: const Text(
        'Task deleted',
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'San Francisco',
          color: Colors.black,
        ),
      ),
      action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            undoDelete(index, item);
          }),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
