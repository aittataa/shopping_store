import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/data_sources.dart';

class DetailsController extends GetxController {
  DataSources _dataSources = Get.put(DataSources());
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadOne(String id) async {
    state.value = true;
    AppResponse response = await _dataSources.getProduct(id);
    state.value = false;
    return response;
  }
}
