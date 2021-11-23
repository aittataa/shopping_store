import 'dart:convert';

import 'package:shopping_store/app/data/models/discount.dart';
import 'package:shopping_store/app/data/models/tag.dart';
import 'package:shopping_store/app/data/models/variant.dart';

Products productFromJson(String str) {
  return Products.fromJson(json.decode(str));
}

class Products {
  final int? limit;
  final int? total;
  final int? pageIndex;
  final int? pageCount;
  final List<Product>? myList;

  Products({
    this.limit,
    this.total,
    this.pageIndex,
    this.pageCount,
    this.myList,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      limit: json["count"],
      total: json["total"],
      pageIndex: json["page"],
      pageCount: json["pageCount"],
      myList: json["data"] == null
          ? []
          : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  //     final String id;
  //     final String publicId;
  //     final String status;
  //     final String name;
  //     final dynamic metaTitle;
  //     final String description;
  //     final String type;
  //     final List<dynamic> variants;
  //     final List<Tag> tags;
  //     final dynamic discount;

  final String? id;
  final String? publicId;
  final String? name;
  final String? metaTitle;
  final String? description;
  final String? type;
  final String? status;
  final List<Tag>? tags;
  final List<Variant>? variants;
  final Discount? discount;

  Product({
    this.id,
    this.publicId,
    this.name,
    this.metaTitle,
    this.description,
    this.type,
    this.status,
    this.tags,
    this.variants,
    this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      publicId: json["publicId"],
      name: json["name"],
      metaTitle: json["meta_title"],
      description: json["description"],
      type: json["type"],
      status: json["status"],
      tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      variants: json["variants"] == null
          ? []
          : List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
      discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
    );
  }
}
