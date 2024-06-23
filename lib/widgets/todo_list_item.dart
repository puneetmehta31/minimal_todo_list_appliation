import 'package:flutter/material.dart';
import '../models/todo_item.dart';

class TodoListItem extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onItemToggled;
  final VoidCallback onItemDeleted;

  const TodoListItem({super.key, 
    required this.item,
    required this.onItemToggled,
    required this.onItemDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Checkbox(
          value: item.isDone,
          onChanged: (bool? value) {
            onItemToggled();
          },
        ),
        title: Text(
          item.task,
          style: TextStyle(
            decoration: item.isDone ? TextDecoration.lineThrough : null,
            fontSize: 18,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onItemDeleted,
        ),
      ),
    );
  }
}
