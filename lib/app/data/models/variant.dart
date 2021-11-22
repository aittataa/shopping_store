import 'package:shopping_store/app/data/models/picture.dart';

class Variant {
  final String? id;
  final String? status;
  final int? price;
  final String? wholesale;
  final bool? taxable;
  final String? taxCode;
  final String? sku;
  final String? size;
  final String? color;
  final int? stock;
  final Picture? picture;

  Variant({
    this.id,
    this.status,
    this.price,
    this.wholesale,
    this.taxable,
    this.taxCode,
    this.sku,
    this.size,
    this.color,
    this.stock,
    this.picture,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json["id"],
      status: json["status"],
      price: json["price"],
      wholesale: json["wholesale"],
      taxable: json["taxable"],
      taxCode: json["taxCode"],
      sku: json["SKU"],
      size: json["size"],
      color: json["color"],
      stock: json["stock"],
      picture: json["image"] == null ? null : Picture.fromJson(json["image"]),
    );
  }

  int get getColor {
    return int.parse("0xFF${color!.substring(1, color!.length)}");
  }
}
