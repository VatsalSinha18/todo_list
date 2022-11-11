import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ToDo {
  String id;
  String todotext;
  late bool Done;

  ToDo({
    required this.id,
    required this.todotext,
    this.Done = false,
  });
}

class ToDoDataBase{

  List todoList=[];
  //reference our box
  final _myBox= Hive.box("mybox");

  void createInitialDataBase(){
    todoList=[
      ToDo(id: "1", todotext: "1")
    ];
  }
  void loadDatabase(){
    todoList = _myBox.get("TODOLIST");
  }
  void updateDatabase(){
     _myBox.put( "TODOLIST" , todoList);
  }
}

