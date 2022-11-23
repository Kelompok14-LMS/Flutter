// ignore_for_file: public_member_api_docs, sort_constructors_first
class CourseCardModel {
  String? header;
  String? author;
  String? images;
  CourseCardModel({
    this.header,
    this.author,
    this.images,
  });

  CourseCardModel.fromJson(Map<String, dynamic> json)
      : header = json['header'],
        author = json['author'],
        images = json['images'];

  Map<String, dynamic> toJson() {
    return {'header': header, 'author': author, 'images': images};
  }
}
