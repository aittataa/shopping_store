import 'package:shopping_store/app/data/data_sources/remote/rest_api.dart';

class Picture {
  //upload/image/5bbb4fa0-5b7c-4673-9be8-21c0184849e6
  final String? id;
  final String? publicId;

  final String? alt;
  final String? location;
  final String? originalName;
  final String? status;
  final int? size;
  final String? mimeType;
  final String? key;
  final String? bucket;

  Picture({
    this.id,
    this.publicId,
    this.alt,
    this.location,
    this.originalName,
    this.status,
    this.size,
    this.mimeType,
    this.key,
    this.bucket,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json["id"],
      publicId: json["publicId"],
      alt: json["alt"],
      location: "${RestApi.apiUrl}/upload/image/${json["id"]}",
      originalName: json["originalName"],
      status: json["status"],
      size: json["size"],
      mimeType: json["mimeType"],
      key: json["key"],
      bucket: json["bucket"],
    );
  }
}
