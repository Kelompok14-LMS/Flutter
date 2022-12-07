class MenteeAssignmentModel {
  String? id;
  String? menteeId;
  String? assignmentId;
  String assignmentUrl;
  String? grade;
  MenteeAssignmentModel({
    this.menteeId,
    this.assignmentId,
    required this.assignmentUrl,
    this.grade,
  });

  MenteeAssignmentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        menteeId = json['menteeId'],
        assignmentId = json['assignmentId'],
        assignmentUrl = json['assignmentUrl'],
        grade = json['grade'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menteeId': menteeId,
      'assignmentId': assignmentId,
      'assignmentUrl': assignmentUrl,
      'grade': grade,
    };
  }
}
