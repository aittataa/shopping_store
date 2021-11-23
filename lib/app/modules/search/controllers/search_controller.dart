import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:shopping_store/app/data/models/product.dart';

class SearchController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;
  var appResponse = AppResponse().obs;
  var products = Products().obs;
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  loadProducts() async {
    state.value = true;
    AppResponse response = await _dataSources.getProducts();
    if (response.success) {
      products.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }
}
