//import 'dart:convert';
//import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
//import 'package:shopping_store/app/config/responses/app_response.dart';
//import 'package:shopping_store/app/data/data_sources/remote/rest_api.dart';
//import 'package:shopping_store/app/data/models/product.dart';
//
//class DataProducts extends GetConnect {
//  @override
//  void onInit() {
//    httpClient.baseUrl = RestApi.apiUrl;
//  }
//
//  _getUrl({String id = ""}) {
//    return Uri.parse("${httpClient.baseUrl}${RestApi.productApi}/$id");
//  }
//
//  getAll() async {
//    final Uri uri = _getUrl();
//    final response = await http.get(uri);
//    AppResponse appResponse = await AppResponse.requestResponse(response);
//    if (appResponse.success) {
//      return AppResponse(
//        success: appResponse.success,
//        messageServer: appResponse.messageServer,
//        messageUser: appResponse.messageUser,
//        response: productFromJson(appResponse.response),
//      );
//    }
//    return appResponse;
//  }
//
//  getById(String id) async {
//    final Uri uri = _getUrl(id: id);
//    final response = await http.get(uri);
//    AppResponse appResponse = await AppResponse.requestResponse(response);
//    if (appResponse.success) {
//      final json = jsonDecode(appResponse.response);
//      return AppResponse(
//        success: appResponse.success,
//        messageServer: appResponse.messageServer,
//        messageUser: appResponse.messageUser,
//        response: Product.fromJson(json),
//      );
//    }
//    return appResponse;
//  }
//}