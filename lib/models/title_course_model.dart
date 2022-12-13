class TitleCourseModel {
  String? titleSection;
  String? section;
  String? videoPertama;
  String? videoKedua;
  TitleCourseModel({
    this.titleSection,
    this.section,
    this.videoPertama,
    this.videoKedua,
  });

  TitleCourseModel.fromJson(Map<String, dynamic> json) 
    : titleSection = json['title_section'],
      section = json['section'],
      videoPertama = json['video_pertama'],
      videoKedua = json['video_kedua'];

  Map<String, dynamic> toJson() {
    return {'title_section': titleSection, 'section': section, 'video_pertama': videoPertama, 'video_kedua': videoKedua};
  }
}