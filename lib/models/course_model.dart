// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String? id;
  String? mentorName;
  String? category;
  String? title;
  String? description;
  String? thumbnail;
  String? createdAt;
  String? updateAt;
  CourseModel({
    this.id,
    this.mentorName,
    this.category,
    this.title,
    this.description,
    this.thumbnail,
    this.createdAt,
    this.updateAt,
  });

  CourseModel.fromJson(Map<String, dynamic> json)
      : id = json['course_id'],
        mentorName = json['mentor'],
        category = json['category'],
        title = json['title'],
        description = json['description'],
        thumbnail = json['thumbnail'],
        createdAt = json['created_at'],
        updateAt = json['update_at'];

  get materials => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mentor': mentorName,
      'category': category,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'created_at': createdAt,
      'update_at': updateAt,
    };
  }
}
