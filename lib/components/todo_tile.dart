import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      this.onChange});

  final String taskName;
  final bool taskComplete;
  final void Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 25
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
                value: taskComplete,
                onChanged: onChange,
                activeColor: Colors.black),
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
