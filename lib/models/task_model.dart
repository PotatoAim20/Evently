class TaskModel {
  String id;
  String title;
  String description;
  int date;
  String category;
  bool isFav;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.isFav = false,
  });

  TaskModel.fromjson(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        date: data['date'],
        category: data['category'],
        isFav: data['isFav'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'category': category,
      'isFav': isFav,
    };
  }
}
