import 'dart:developer';

import 'package:flutter/material.dart';
import '../widgets/items.dart';
import '../colors for app/colors.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> _foundToDo = ToDo.todoList();
  var _filteredTodo = ToDo.todoList();


  final _todoController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackWhite,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    searchbox(),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 15),
                          child: Text(
                            "All to-dos",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        for (ToDo todo1 in _filteredTodo)
                          ToDoItems(
                            todo: todo1,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _delteToDoItem,
                          ),
                      ],
                    ))
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: "What's Next!",
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                      onPressed: () {
                        addToDoItems(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.Done = !todo.Done;
    });
  }

  void _delteToDoItem(String id) {
    setState(() {
      _foundToDo.removeWhere((item) => item.id == id);
    });
    runFeature(_searchController.text);
  }

  void addToDoItems(String toDo) {
    setState(() {
      _foundToDo.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todotext: toDo,
      ));
    });
    _todoController.clear();
    runFeature(_searchController.text);
  }

  void runFeature(String enterkeyword) {
    setState(() {
      _filteredTodo = _foundToDo.where((element) => element.todotext.toLowerCase().contains(enterkeyword.trim().isNotEmpty ? enterkeyword : "")).toList();
    });
  }
  Container searchbox() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: _searchController,
        onChanged: runFeature,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: MatBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: AshGrey)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: BackWhite,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: MatBlack,
            size: 40,
          ),
          Container(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/todo.jpg"),
            ),   
          ),],
      ),
    );
  }
}


