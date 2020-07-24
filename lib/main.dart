import 'package:flutter/material.dart';

class Todo {
  final String baslik;
  final String icerik;
  Todo(this.baslik, this.icerik);
}

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: TodosScreen(
        todos: List.generate(20, (i) => Todo("$i - Başlık", "$i - İçerik")),
      )));
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;
  TodosScreen({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].baslik),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetayScreen(),
                      settings: RouteSettings(arguments: todos[index])));
            },
          );
        },
      ),
    );
  }
}

class DetayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.baslik),
      ),
      body: Text(todo.icerik),
    );
  }
}
