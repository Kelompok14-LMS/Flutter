import 'dart:convert';

class DetailCourseModel {
  String? image;
  String? title;
  String? description;
  String? author;
  String? rating;
  String? jumlahRating;
  DetailCourseModel({
    this.image,
    this.title,
    this.description,
    this.author,
    this.rating,
    this.jumlahRating
  });

  DetailCourseModel.fromJson(Map<String, dynamic> json) 
    : image = json['image'],
      title = json['title'],
      description = json['description'],
      author = json['author'],
      rating = json['rating'],
      jumlahRating = json['jumlah_rating'];

  Map<String, dynamic> toJson() {
    return {'image': image, 'title': title, 'description': description, 'author': author, 'rating': rating, 'jumlah_rating': jumlahRating};
  }
}