class AssignmentModel {
  String? id;
  String? courseId;
  String? description;
  String? createdAt;
  String? updateAt;
  AssignmentModel({
    this.id,
    this.courseId,
    this.description,
    this.createdAt,
    this.updateAt,
  });

  AssignmentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        courseId = json['courseId'],
        description = json['description'],
        createdAt = json['create_id'],
        updateAt = json['update_id'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'description': description,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }
}
