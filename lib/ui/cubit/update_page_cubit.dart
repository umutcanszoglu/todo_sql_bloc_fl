import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_fl/data/repo/todo_dao_repository.dart';

class UpdatePageCubit extends Cubit<void> {
  UpdatePageCubit() : super(0);

  var todoRepo = TodoDaoRepository();
  Future<void> updateTodo(int id, String name) async {
    await todoRepo.updateTodo(id, name);
  }
}
