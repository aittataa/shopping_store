import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/rest_api.dart';
import 'package:shopping_store/app/data/models/category.dart';
import 'package:shopping_store/app/data/models/product.dart';
import 'package:shopping_store/app/data/models/user.dart';

class RemoteDataSources extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = RestApi.apiUrl;
  }

  get loadApp async {
    final Uri uri = Uri.parse(httpClient.baseUrl.toString());
    final response = await http.get(uri);
    return AppResponse.requestResponse(response);
  }

  _getUrl(String type, {String id = ""}) {
    return Uri.parse("${httpClient.baseUrl}$type$id");
  }

  loadUser(String id) async {
    final Uri uri = _getUrl(RestApi.userApi, id: "/" + id);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: User.fromJson(json),
      );
    } else {
      return appResponse;
    }
  }

  loginUser(User user) async {
    final Uri uri = _getUrl(RestApi.loginApi);
    final response = await http.post(uri, body: user.toLogin());
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: User.fromJson(json),
      );
    } else {
      return appResponse;
    }
  }

  registerUser(User user) async {
    final Uri uri = _getUrl(RestApi.userApi);
    final response = await http.post(uri, body: user.toRegister());
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: User.fromJson(json),
      );
    } else {
      return appResponse;
    }
  }

  updateUser(User user) async {
    final Uri uri = _getUrl(RestApi.userApi, id: "/" + user.id!);
    final response = await http.put(uri, body: user.toUpdate());
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: User.fromJson(json),
      );
    } else {
      return appResponse;
    }
  }

  getCategories() async {
    final Uri uri = _getUrl(RestApi.categoriesApi + RestApi.sortApi);
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
    final Uri uri = _getUrl(RestApi.categoriesApi, id: "/" + id);
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
    final Uri uri = _getUrl(RestApi.productApi + RestApi.sortApi);
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
    final Uri uri = _getUrl(RestApi.productApi, id: "/" + id);
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

  getOrder() {}
}
