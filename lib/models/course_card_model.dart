class CourseCardModel {
  String? id;
  String? title;
  String? mentor;
  String? thumbnail;
  CourseCardModel({
    this.title,
    this.mentor,
    this.thumbnail,
  });

  CourseCardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        mentor = json['mentor'],
        thumbnail = json['thumbnail'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'mentor': mentor,
      'thumbnail': thumbnail,
    };
  }
}
