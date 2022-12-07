class TitleCourseModel {
  String? title_course;
  String? section;
  String? title_video;
  String? title_slide;
  String? title_tugas;
  TitleCourseModel({
    this.title_course,
    this.section,
    this.title_video,
    this.title_slide,
    this.title_tugas,
  });

  TitleCourseModel.fromJson(Map<String, dynamic> json) 
    : title_course = json['title_course'],
      section = json['section'],
      title_video = json['title_video'],
      title_slide = json['title_slide'],
      title_tugas = json['title_tugas'];

  Map<String, dynamic> toJson() {
    return {'title_course': title_course, 'section': section, 'title_video': title_video, 'title_slide': title_slide, 'title_tugas': title_tugas};
  }
}