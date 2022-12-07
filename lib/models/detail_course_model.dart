class DetailCourseModel {
  String? image;
  String? title;
  String? description;
  String? favorite;
  String? author;
  DetailCourseModel({
    this.image,
    this.title,
    this.description,
    this.favorite,
    this.author,
  });

  DetailCourseModel.fromJson(Map<String, dynamic> json) 
    : image = json['image'],
      title = json['title'],
      description = json['description'],
      favorite = json['favorite'],
      author = json['author'];

  Map<String, dynamic> toJson() {
    return {'image': image, 'title': title, 'description': description, 'favorite': favorite, 'author': author};
  }
}