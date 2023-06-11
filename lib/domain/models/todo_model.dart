class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel(
    this.userId,
    this.id,
    this.title,
    this.completed,
  );

  TodoModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodoModel(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id < 0 ? null : id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  static List<TodoModel> fromListMap(List<Map<String, dynamic>> list) =>
      list.map((e) => TodoModel.fromMap(e)).toList();

  @override
  String toString() {
    return 'TodoModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }
}
