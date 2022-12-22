class ModulesModel {
  String? id;
  String? courseId;
  String title;
  String description;
  String? createdAt;
  String? updateAt;
  ModulesModel({
    this.id,
    this.courseId,
    required this.title,
    required this.description,
    this.createdAt,
    this.updateAt,
  });

  ModulesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        courseId = json['course_id'],
        title = json['title'],
        description = json['description'],
        createdAt = json['create_at'],
        updateAt = json['update_at'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }
}
