class Tag {
  final String? id;
  final String? name;
  final String? description;
  final String? status;

  Tag({
    this.id,
    this.name,
    this.description,
    this.status,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      status: json["status"],
    );
  }
}
