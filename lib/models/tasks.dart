class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  toggleDone() {
    isDone = !isDone;
  }

  Task.fromMap(Map map)
      : name = map['title'],
        isDone = map['isDone'];

  Map toMap() {
    return {
      'title': name,
      'isDone': isDone,
    };
  }
}
