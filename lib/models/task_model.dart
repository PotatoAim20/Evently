class TaskModel {
  String id;
  String userId;
  String title;
  String description;
  int date;
  String category;
  bool isFav;

  TaskModel({
    this.id = '',
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.isFav = false,
  });

  TaskModel.fromJson(Map<String, dynamic> data)
    : this(
        id: data['id'],
        userId: data['userId'],
        title: data['title'],
        description: data['description'],
        date: data['date'],
        category: data['category'],
        isFav: data['isFav'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'date': date,
      'category': category,
      'isFav': isFav,
    };
  }
}
