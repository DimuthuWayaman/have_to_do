import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference the hive box
  final _myBox = Hive.box('mybox');

  //run this method if this is the first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Default Tasks", false],
      ["Slide Left to Delete", false],
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
  

}
