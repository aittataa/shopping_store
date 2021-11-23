import 'package:get/get.dart';
import 'package:shopping_store/app/data/data_sources/remote/remote_data_sources.dart';

class OrderController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());

  @override
  void onInit() {
    super.onInit();
  }
}
