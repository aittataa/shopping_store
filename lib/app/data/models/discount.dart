import 'dart:convert';

Discounts discountsFromJson(String str) => Discounts.fromJson(json.decode(str));

class Discounts {
  final int? limit;
  final int? total;
  final int? pageIndex;
  final int? pageCount;
  final List<Discount>? myList;

  Discounts({
    this.limit,
    this.total,
    this.pageIndex,
    this.pageCount,
    this.myList,
  });

  factory Discounts.fromJson(Map<String, dynamic> json) {
    return Discounts(
      limit: json["count"],
      total: json["total"],
      pageIndex: json["page"],
      pageCount: json["pageCount"],
      myList: json["data"] == null
          ? []
          : List<Discount>.from(json["data"].map((x) => Discount.fromJson(x))),
    );
  }
}

class Discount {
  final String? id;
  final String? name;
  final String? description;
  final String? code;
  final DateTime? startDate;
  final int? discountPercent;
  final int? minAmount;
  final bool? isGlobal;
  final String? status;

  Discount({
    this.id,
    this.name,
    this.description,
    this.code,
    this.startDate,
    this.discountPercent,
    this.minAmount,
    this.isGlobal,
    this.status,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      code: json["code"],
      startDate: DateTime.parse(json["start_date"]),
      discountPercent: json["discount_percent"],
      minAmount: json["min_ammount"],
      isGlobal: json["isGlobal"],
      status: json["status"],
    );
  }
}
