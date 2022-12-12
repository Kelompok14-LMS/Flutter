class MaterialsModel {
  String? id;
  String? moduleId;
  String title;
  String videoUrl;
  String? description;
  String? createdAt;
  String? updateAt;
  MaterialsModel({
    this.id,
    this.moduleId,
    required this.title,
    required this.videoUrl,
    this.description,
    this.createdAt,
    this.updateAt,
  });

  MaterialsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        moduleId = json['module_id'],
        title = json['title'],
        videoUrl = json['url'],
        description = json['description'],
        createdAt = json['create_at'],
        updateAt = json['update_at'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'moduleId': moduleId,
      'title': title,
      'videoUrl': videoUrl,
      'description': description,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }
}
