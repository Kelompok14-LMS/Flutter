class SlideMateriModel {
  String? id;
  String? material_id;
  String? url;
  String? type;
  String? description;
  String? created_at;
  String? updated_at;
  SlideMateriModel({
    this.id,
    this.material_id,
    this.url,
    this.type,
    this.description,
    this.created_at,
    this.updated_at,
  });

  SlideMateriModel.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      material_id = json['material_id'],
      url = json['url'],
      type = json['type'],
      description = json['description'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'material_id': material_id, 'url': url, 'description': description};
  }
}