import 'package:flutter/material.dart';
import '../colors for app/colors.dart';

import '../model/todo.dart';

class ToDoItems extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItems({Key? key,
    required this.todo,
    this.onToDoChanged,
    this.onDeleteItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        tileColor: Colors.white,
        leading: Icon(
          todo.Done?Icons.check_box:Icons.check_box_outline_blank,
          color: NBlue,
        ),
        title: Text(
          todo.todotext!,
          style: TextStyle(
            fontSize: 20,
            color: MatBlack,
            decoration: todo.Done?TextDecoration.lineThrough:null,
          ),
        ),
        trailing: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: NRed,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 18,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    onDeleteItem(todo.id);
                  },
                )

    ),

      )


        );

  }
}
