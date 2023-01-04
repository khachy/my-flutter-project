import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo_app/utils/todolist_empty.dart';

class ToDoDatabase {
  // list of todos
  List toDoList = [];

  // reference the box
  final myBox = Hive.box('myBox');

  // load the data from the database
  void loadData() {
    toDoList = myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    myBox.put("TODOLIST", toDoList);
  }
}
