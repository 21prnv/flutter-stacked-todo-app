class Todo {
  String task;
  int id; // Add this line

  Todo({
    required this.task,
    required this.id, // Add this line
  });

  // Factory method to create a Todo object from a JSON map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int, // Add this line

      task: json['task'] as String,
    );
  }
}
