import 'dart:convert';

Brands brandsFromJson(String str) => Brands.fromJson(json.decode(str));

class Brands {
  final int? limit;
  final int? total;
  final int? pageIndex;
  final int? pageCount;
  final List<Brand>? myList;

  Brands({
    this.limit,
    this.total,
    this.pageIndex,
    this.pageCount,
    this.myList,
  });

  factory Brands.fromJson(Map<String, dynamic> json) {
    return Brands(
      limit: json["count"],
      total: json["total"],
      pageIndex: json["page"],
      pageCount: json["pageCount"],
      myList: json["data"] == null
          ? []
          : List<Brand>.from(json["data"].map((x) => Brand.fromJson(x))),
    );
  }
}

class Brand {
  final String? id;
  final String? name;
  final String? description;
  final String? status;

  Brand({
    this.id,
    this.name,
    this.description,
    this.status,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      status: json["status"],
    );
  }
}
