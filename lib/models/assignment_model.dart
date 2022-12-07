class AssignmentModel {
  String? id;
  String? moduleId;
  String? pdfUrl;
  String? title;
  String? descriptions;
  AssignmentModel({
    this.moduleId,
    this.pdfUrl,
    this.title,
    this.descriptions,
  });

  AssignmentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        moduleId = json['moduleId'],
        pdfUrl = json['pdfUrl'],
        title = json['title'],
        descriptions = json['descriptions'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'moduleId': moduleId,
      'pdfUrl': pdfUrl,
      'title': title,
      'descriptions': descriptions,
    };
  }
}
