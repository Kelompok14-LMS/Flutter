class MaterialModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  MaterialModel({this.code, this.status, this.message, this.data});

  MaterialModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? courseId;
  String? categoryId;
  String? mentorId;
  String? mentor;
  String? category;
  String? title;
  String? description;
  String? thumbnail;
  int? totalMaterials;
  int? progress;
  int? totalReviews;
  double? rating;
  List<Modules>? modules;
  Assignment? assignment;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.courseId,
      this.categoryId,
      this.mentorId,
      this.mentor,
      this.category,
      this.title,
      this.description,
      this.thumbnail,
      this.totalMaterials,
      this.progress,
      this.totalReviews,
      this.rating,
      this.modules,
      this.assignment,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    categoryId = json['category_id'];
    mentorId = json['mentor_id'];
    mentor = json['mentor'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    totalMaterials = json['total_materials'];
    progress = json['progress'];
    totalReviews = json['total_reviews'];
    rating = json["rating"] is int
        ? (json['rating'] as int).toDouble()
        : json['rating'];
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(Modules.fromJson(v));
      });
    }
    assignment = json['assignment'] != null
        ? Assignment.fromJson(json['assignment'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['category_id'] = categoryId;
    data['mentor_id'] = mentorId;
    data['mentor'] = mentor;
    data['category'] = category;
    data['title'] = title;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['total_materials'] = totalMaterials;
    data['progress'] = progress;
    data['total_reviews'] = totalReviews;
    data['rating'] = rating;
    if (modules != null) {
      data['modules'] = modules!.map((v) => v.toJson()).toList();
    }
    if (assignment != null) {
      data['assignment'] = assignment!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Modules {
  String? moduleId;
  String? courseId;
  String? title;
  String? description;
  List<Materials>? materials;
  String? createdAt;
  String? updatedAt;

  Modules(
      {this.moduleId,
      this.courseId,
      this.title,
      this.description,
      this.materials,
      this.createdAt,
      this.updatedAt});

  Modules.fromJson(Map<String, dynamic> json) {
    moduleId = json['module_id'];
    courseId = json['course_id'];
    title = json['title'];
    description = json['description'];
    if (json['materials'] != null) {
      materials = <Materials>[];
      json['materials'].forEach((v) {
        materials!.add(Materials.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['module_id'] = moduleId;
    data['course_id'] = courseId;
    data['title'] = title;
    data['description'] = description;
    if (materials != null) {
      data['materials'] = materials!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Materials {
  String? materialId;
  String? moduleId;
  String? title;
  String? url;
  String? description;
  bool? completed;
  String? createdAt;
  String? updatedAt;

  Materials(
      {this.materialId,
      this.moduleId,
      this.title,
      this.url,
      this.description,
      this.completed,
      this.createdAt,
      this.updatedAt});

  Materials.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    moduleId = json['module_id'];
    title = json['title'];
    url = json['url'];
    description = json['description'];
    completed = json['completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['material_id'] = materialId;
    data['module_id'] = moduleId;
    data['title'] = title;
    data['url'] = url;
    data['description'] = description;
    data['completed'] = completed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Assignment {
  String? assignmentId;
  String? courseId;
  String? title;
  String? description;
  bool? completed;
  String? createdAt;
  String? updatedAt;

  Assignment(
      {this.assignmentId,
      this.courseId,
      this.title,
      this.description,
      this.completed,
      this.createdAt,
      this.updatedAt});

  Assignment.fromJson(Map<String, dynamic> json) {
    assignmentId = json['assignment_id'];
    courseId = json['course_id'];
    title = json['title'];
    description = json['description'];
    completed = json['completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assignment_id'] = assignmentId;
    data['course_id'] = courseId;
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
