import 'package:flutter/cupertino.dart';

class ToDo {
  String id;
  String todotext;
  late bool Done;

  ToDo({
    required this.id,
    required this.todotext,
    this.Done = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todotext: "Checked in!", Done:true),



    ];
  }
}