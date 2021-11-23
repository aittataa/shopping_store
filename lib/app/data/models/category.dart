import 'dart:convert';

import 'package:shopping_store/app/data/models/picture.dart';
import 'package:shopping_store/app/data/models/product.dart';

Categories categoriesFromJson(String str) {
  return Categories.fromJson(json.decode(str));
}

class Categories {
  final int? limit;
  final int? total;
  final int? pageIndex;
  final int? pageCount;
  final List<Category>? myList;

  Categories({
    this.limit,
    this.total,
    this.pageIndex,
    this.pageCount,
    this.myList,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      limit: json["count"],
      total: json["total"],
      pageIndex: json["page"],
      pageCount: json["pageCount"],
      myList:
          List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    );
  }
}

class Category {
  final String? id;
  final String? publicId;
  final String? name;
  final String? description;
  final String? status;
  final Picture? picture;
  final List<Product>? myList;

  Category({
    this.id,
    this.publicId,
    this.name,
    this.description,
    this.status,
    this.picture,
    this.myList,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      publicId: json["publicId"],
      status: json["status"],
      name: json["name"],
      description: json["description"],
      picture: json["image"] == null ? null : Picture.fromJson(json["image"]),
      myList: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"].map((x) => Product.fromJson(x))),
    );
  }
}
