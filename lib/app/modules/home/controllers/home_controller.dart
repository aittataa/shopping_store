import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/data_sources.dart';
import 'package:shopping_store/app/data/models/product.dart';

class HomeController extends GetxController {
  final DataSources _dataSources = Get.put(DataSources());
  var state = false.obs;
  var appResponse = AppResponse().obs;
  var products = Products().obs;

  @override
  void onInit() {
    super.onInit();
    loadAll();
  }

  loadAll() async {
    state.value = true;
    AppResponse response = await _dataSources.getProducts();
    if (response.success) {
      products.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }

  loadOne(String id) async {
    state.value = true;
    AppResponse response = await _dataSources.getProduct(id);
    state.value = false;
    return response;
  }
}
