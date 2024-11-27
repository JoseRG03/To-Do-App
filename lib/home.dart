import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_tile.dart';

import 'components/dialog_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//TODO
// Usar flutter_slidable para poder deslizar un task y eliminarlo de la lista
class _HomeState extends State<Home> {
  final _controller = TextEditingController();

  List taskList = [
    ["Dar Clases", false],
    ["Ir al Super", false],
  ];

  // Metodo para marcar/desmarcar el checkbox
  void checkBoxChange(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  // Metodo para crear una tarea
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: cancelTask,
          );
        });
  }

  // Guardar una nueva tarea
  void saveNewTask() {
    setState(() {
      taskList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void cancelTask() {
    Navigator.pop(context);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(120),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: taskList[index][0],
            taskComplete: taskList[index][1],
            onChange: (value) {
              checkBoxChange(value, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        shape: CircleBorder(eccentricity: 1),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
