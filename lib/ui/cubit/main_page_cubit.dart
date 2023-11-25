import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_fl/data/entity/todos.dart';
import 'package:todo_task_fl/data/repo/todo_dao_repository.dart';

class MainPageCubit extends Cubit<List<Todos>> {
  MainPageCubit() : super(<Todos>[]);

  var toDosRepo = TodoDaoRepository();

  Future<void> getTodos() async {
    var todos = await toDosRepo.getTodos();
    emit(todos);
  }

  Future<void> deleteTodo(int id) async {
    await toDosRepo.delete(id);
    getTodos();
  }

  Future<void> search(String searchText) async {
    var todos = await toDosRepo.search(searchText);
    emit(todos);
  }
}
