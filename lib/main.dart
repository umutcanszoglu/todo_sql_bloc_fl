import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_fl/ui/cubit/add_page_cubit.dart';
import 'package:todo_task_fl/ui/cubit/main_page_cubit.dart';
import 'package:todo_task_fl/ui/cubit/update_page_cubit.dart';
import 'package:todo_task_fl/ui/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddPageCubit()),
        BlocProvider(create: (context) => UpdatePageCubit()),
        BlocProvider(create: (context) => MainPageCubit()),
      ],
      child: MaterialApp(
        title: 'ToDo Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
