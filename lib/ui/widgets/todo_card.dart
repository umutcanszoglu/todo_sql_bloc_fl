import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todoName, this.onTap, required this.todo});
  final String todoName;
  final Function()? onTap;
  final String todo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent.withOpacity(0.5),
            Colors.deepPurple,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            todo,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Do you want to delete $todoName?"),
                  action: SnackBarAction(
                    label: "Yes",
                    onPressed: onTap!,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
