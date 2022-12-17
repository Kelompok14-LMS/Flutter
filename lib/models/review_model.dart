class ReviewModel {
  String? id;
  String? menteeId;
  String? courseId;
  String? mentee;
  String? profilePicture;
  String? title;
  String? description;
  int? rating;
  String? createdAt;
  String? updatedAt;

  ReviewModel(
      {this.id,
      this.menteeId,
      this.courseId,
      this.mentee,
      this.profilePicture,
      this.title,
      this.description,
      this.rating,
      this.createdAt,
      this.updatedAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menteeId = json['mentee_id'];
    courseId = json['course_id'];
    mentee = json['mentee'];
    profilePicture = json['profile_picture'];
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mentee_id'] = menteeId;
    data['course_id'] = courseId;
    data['mentee'] = mentee;
    data['profile_picture'] = profilePicture;
    data['title'] = title;
    data['description'] = description;
    data['rating'] = rating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
