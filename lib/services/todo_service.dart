import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/model/todo.dart';

class TodoService {
  final supabase = Supabase.instance.client;

  // List<Todo> tasks = [];

  // void addTodo(String task) {
  //   String id = DateTime.now().millisecondsSinceEpoch.toString();

  //   tasks.add(Todo(id: id, task: task));
  //   print(tasks);
  // }

  void addTodo(String task) async {
    await supabase.from('todos').insert({
      'task': task,
    });
  }

  Future<List<Todo>> readTodos() async {
    try {
      var res = await supabase.from('todos').select();

      // Check if the response contains an error property
      if (res is List && res.isNotEmpty) {
        final firstItem = res.first;
        if (firstItem is Map<String, dynamic> &&
            firstItem.containsKey('error')) {
          print("Supabase Error: ${firstItem['error']}");
          throw firstItem['error'];
        }
      }

      // Access the data property to get the list of todos
      final todosList =
          (res as List<dynamic>).map((item) => Todo.fromJson(item)).toList();
      print(todosList);
      return todosList;
    } catch (e) {
      print("Exception during readTodos: $e");
      throw e.toString();
    }
  }

  void updateTodo(int id, String newtask) async {
    try {
      await supabase.from('todos').upsert({'id': id, 'task': newtask});
    } catch (e) {
      throw e.toString();
    }
  }

  void deleteTodo(int id) async {
    try {
      await supabase.from('todos').delete().match({'id': id});
    } catch (e) {}
  }
  // void deleteTodo(String id) {
  //   tasks.removeWhere((element) => element.id == id);
  // }

  // void updateTodo(String newtask, String id) {
  //   tasks.firstWhere((element) => element.id == id).task = newtask;
  // }
}
