class VideoMateriModel {
  String? id;
  String? material_id;
  String? url;
  String? description;
  VideoMateriModel({
    this.id,
    this.material_id,
    this.url,
    this.description,
  });

  VideoMateriModel.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      material_id = json['material_id'],
      url = json['url'],
      description = json['description'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'material_id': material_id, 'url': url, 'description': description};
  }
}