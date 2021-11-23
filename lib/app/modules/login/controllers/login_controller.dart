import 'package:get/get.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:shopping_store/app/data/models/user.dart';

class LoginController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loginUser(User user) async {
    state.value = true;
    AppResponse response = await _dataSources.loginUser(user);
    state.value = false;
    return response;
  }
}
