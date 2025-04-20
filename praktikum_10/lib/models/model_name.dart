class Item {
  final int? id;
  final String title;
  final String description;
  final String createdAt;

  Item({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    createdAt: json['createdAt'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
