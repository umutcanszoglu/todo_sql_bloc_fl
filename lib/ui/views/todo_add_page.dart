import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_fl/ui/cubit/add_page_cubit.dart';

class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    var txtController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
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
                  context.read<AddPageCubit>().addTodo(txtController.text);
                },
                child: const Text("Add Note")),
          ],
        ),
      ),
    );
  }
}
