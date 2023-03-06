import 'package:flutter/material.dart';
import 'package:flutter_todo_list/models/todo.dart';
import 'dart:async';
import 'package:flutter_todo_list/providers/todo_default.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> todos = [];
  TodoDefault todoDefault = TodoDefault();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    todos = todoDefault.getTodos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book),
                    Text('뉴스'),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+', style: TextStyle(fontSize: 25)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String title = '';
                  String description = '';

                  return AlertDialog(
                    title: Text('할 일 추가하기'),
                    content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {
                              title = value;
                            },
                            decoration: InputDecoration(labelText: '제목'),
                          ),
                          TextField(
                            onChanged: (value) {
                              description = value;
                            },
                            decoration: InputDecoration(labelText: '설명'),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              print('[UI] ADD');
                              todoDefault.addTodo(
                                  Todo(title: title, description: description));
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('추가')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소')),
                    ],
                  );
                });
          },
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todos[index].title),
                    onTap: () {},
                    trailing: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(Icons.edit),
                              onTap: () {},
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(Icons.delete),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: todos.length));
  }
}
