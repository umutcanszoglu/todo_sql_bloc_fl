import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_task_fl/data/entity/todos.dart';
import 'package:todo_task_fl/ui/cubit/main_page_cubit.dart';
import 'package:todo_task_fl/ui/views/todo_add_page.dart';
import 'package:todo_task_fl/ui/views/todo_update_page.dart';
import 'package:todo_task_fl/ui/widgets/todo_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (searchResult) {
                  context.read<MainPageCubit>().search(searchResult);
                },
              )
            : const Text("Todos"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                    context.read<MainPageCubit>().getTodos();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<MainPageCubit, List<Todos>>(
        builder: (context, todoList) {
          if (todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                var todo = todoList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoUpdatePage(todo: todo))).then(
                      (value) {
                        context.read<MainPageCubit>().getTodos();
                      },
                    );
                  },
                  child: TodoCard(
                    todoName: todo.name,
                    todo: todo.name,
                    onTap: () {
                      context.read<MainPageCubit>().deleteTodo(todo.id);
                    },
                  ),
                );
              },
            );
          } else {
            return Lottie.asset("assets/empty.json");
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoAddPage()))
              .then(
            (value) {
              context.read<MainPageCubit>().getTodos();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
