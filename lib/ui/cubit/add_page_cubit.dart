import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_fl/data/repo/todo_dao_repository.dart';

class AddPageCubit extends Cubit<void> {
  AddPageCubit() : super(0);
  var todoRepo = TodoDaoRepository();

  Future<void> addTodo(String name) async {
    await todoRepo.addTodo(name);
  }
}
