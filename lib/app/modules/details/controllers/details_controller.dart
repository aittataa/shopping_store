import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/remote_data_sources.dart';

class DetailsController extends GetxController {
  RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadProduct(String id) async {
    state.value = true;
    AppResponse response = await _dataSources.getProduct(id);
    state.value = false;
    return response;
  }
}
