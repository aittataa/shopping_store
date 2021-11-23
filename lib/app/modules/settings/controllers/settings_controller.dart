import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/remote_data_sources.dart';

class SettingsController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  loadUser(String id) async {
    state.value = true;
    final AppResponse appResponse = await _dataSources.loadUser(id);
    state.value = false;
    return appResponse;
  }
}
