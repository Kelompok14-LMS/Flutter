// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String? id;
  String? mentorName;
  String? category;
  String? title;
  String? descriptions;
  String? thumbnail;
  String? createdAt;
  String? updateAt;
  CourseModel({
    this.id,
    this.mentorName,
    this.category,
    this.title,
    this.descriptions,
    this.thumbnail,
    this.createdAt,
    this.updateAt,
  });

  CourseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mentorName = json['mentor_id'],
        category = json['category_id'],
        title = json['title'],
        descriptions = json['descriptions'],
        thumbnail = json['thumbnail'],
        createdAt = json['created_at'],
        updateAt = json['update_at'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mentor_id': mentorName,
      'category_id': category,
      'title': title,
      'descriptions': descriptions,
      'thumbnail': thumbnail,
      'created_at': createdAt,
      'update_at': updateAt,
    };
  }
}
