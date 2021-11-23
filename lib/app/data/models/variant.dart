import 'package:shopping_store/app/data/models/picture.dart';

class Variant {
  final String? id;
  final String? publicId;
  final String? size;
  final String? color;
  final int? price;
  final String? sku;
  final String? taxCode;
  final bool? taxable;
  final String? barcode;
  final String? wholesale;
  final int? stock;
  final String? status;
  final Picture? picture;

  Variant({
    this.id,
    this.publicId,
    this.size,
    this.color,
    this.price,
    this.sku,
    this.taxCode,
    this.taxable,
    this.barcode,
    this.wholesale,
    this.stock,
    this.status,
    this.picture,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json["id"],
      publicId: json["publicId"],
      size: json["size"],
      color: json["color"],
      price: json["price"],
      sku: json["SKU"],
      taxCode: json["taxCode"],
      taxable: json["taxable"],
      barcode: json["Barcode"],
      wholesale: json["wholesale"],
      stock: json["stock"],
      status: json["status"],
      picture: json["image"] == null ? null : Picture.fromJson(json["image"]),
    );
  }

  int get getColor {
    return int.parse("0xFF${color!.substring(1, color!.length)}");
  }
}
