import 'package:todo_task_fl/data/entity/todos.dart';
import 'package:todo_task_fl/sqlite/database_helper.dart';

class TodoDaoRepository {
  Future<List<Todos>> getTodos() async {
    var db = await DatabaseHelper.dbConnection();
    List<Map<String, dynamic>> rows = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(
      rows.length,
      (index) {
        var row = rows[index];
        var id = row["id"];
        var name = row["name"];

        return Todos(id: id, name: name);
      },
    );
  }

  Future<void> delete(int id) async {
    var db = await DatabaseHelper.dbConnection();

    await db.delete("toDos", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Todos>> search(String searchText) async {
    var db = await DatabaseHelper.dbConnection();
    List<Map<String, dynamic>> rows =
        await db.rawQuery("SELECT * FROM toDos WHERE name like '%$searchText%'");

    return List.generate(
      rows.length,
      (index) {
        var row = rows[index];
        var id = row["id"];
        var name = row["name"];

        return Todos(id: id, name: name);
      },
    );
  }

  Future<void> addTodo(String name) async {
    var db = await DatabaseHelper.dbConnection();

    var newTodo = <String, dynamic>{};
    newTodo["name"] = name;

    await db.insert("toDos", newTodo);
  }

  Future<void> updateTodo(int id, String name) async {
    var db = await DatabaseHelper.dbConnection();

    var updatedTodo = <String, dynamic>{};
    updatedTodo["name"] = name;

    await db.update("toDos", updatedTodo, where: "id = ?", whereArgs: [id]);
  }
}
