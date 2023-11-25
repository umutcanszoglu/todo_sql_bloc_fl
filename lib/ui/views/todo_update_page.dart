import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_fl/data/entity/todos.dart';
import 'package:todo_task_fl/ui/cubit/update_page_cubit.dart';

class TodoUpdatePage extends StatelessWidget {
  const TodoUpdatePage({super.key, required this.todo});
  final Todos todo;

  @override
  Widget build(BuildContext context) {
    var txtController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: txtController,
              decoration: const InputDecoration(hintText: "Note"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UpdatePageCubit>().updateTodo(todo.id, txtController.text);
              },
              child: const Text("Update Note"),
            ),
          ],
        ),
      ),
    );
  }
}
