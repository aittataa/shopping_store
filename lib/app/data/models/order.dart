import 'dart:convert';

import 'package:shopping_store/app/data/models/user.dart';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

class Orders {
  final int? limit;
  final int? total;
  final int? pageIndex;
  final int? pageCount;
  final List<Order>? myList;

  Orders({
    this.limit,
    this.total,
    this.pageIndex,
    this.pageCount,
    this.myList,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      limit: json["count"],
      total: json["total"],
      pageIndex: json["page"],
      pageCount: json["pageCount"],
      myList:
          json["data"] == null ? [] : List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
    );
  }
}

class Order {
  final String? id;
  final String? publicId;
  final int? total;
  final String? status;
  final User? user;

  Order({
    this.id,
    this.publicId,
    this.status,
    this.total,
    this.user,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        publicId: json["publicId"],
        status: json["status"],
        total: json["total"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "publicId": publicId,
        "status": status,
        "total": total,
        "user": user!.toJson(),
      };
}
