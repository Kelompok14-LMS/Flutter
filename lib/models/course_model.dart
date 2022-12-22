// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseModel {
  String? id;
  String? mentorName;
  String? category;
  String? title;
  String? description;
  int? totalReviews;
  double? rating;
  int? totalMaterials;
  int? progress;
  String? status;
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
    this.totalReviews,
    this.rating,
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
        totalReviews = json['total_reviews'],
        rating = json["rating"] is int
            ? (json['rating'] as int).toDouble()
            : json['rating'],
        totalMaterials = json['total_materials'],
        progress = json['progress'],
        status = json["status"],
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
      'total_reviews': totalReviews,
      'rating': rating,
      'progress': progress,
      'total_materials': totalMaterials,
      'status': status
    };
  }
}
