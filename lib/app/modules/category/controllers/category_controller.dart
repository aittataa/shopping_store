import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/data_sources.dart';
import 'package:shopping_store/app/data/models/category.dart';

class CategoryController extends GetxController {
  final DataSources _dataSources = Get.put(DataSources());
  var state = false.obs;
  var appResponse = AppResponse().obs;
  var categories = Categories().obs;

  @override
  void onInit() {
    super.onInit();
    loadAll();
  }

  loadAll() async {
    state.value = true;
    AppResponse response = await _dataSources.getCategories();
    if (response.success) {
      categories.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }

  loadOne(String id) async {
    state.value = true;
    AppResponse response = await _dataSources.getCategory(id);
    state.value = false;
    return response;
  }
}
