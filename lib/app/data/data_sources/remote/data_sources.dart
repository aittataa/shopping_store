import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/rest_api.dart';
import 'package:shopping_store/app/data/models/category.dart';
import 'package:shopping_store/app/data/models/product.dart';

class DataSources extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = RestApi.apiUrl;
  }

  _getUrl(String type, {String id = ""}) {
    return Uri.parse("${httpClient.baseUrl}$type/$id");
  }

  getCategories() async {
    final Uri uri = _getUrl(RestApi.categoriesApi);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: categoriesFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getCategory(String id) async {
    final Uri uri = _getUrl(RestApi.categoriesApi, id: id);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: Category.fromJson(json),
      );
    }
    return appResponse;
  }

  getProducts() async {
    final Uri uri = _getUrl(RestApi.productApi);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: productFromJson(appResponse.response),
      );
    }
    return appResponse;
  }

  getProduct(String id) async {
    final Uri uri = _getUrl(RestApi.productApi, id: id);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: Product.fromJson(json),
      );
    }
    return appResponse;
  }
}
