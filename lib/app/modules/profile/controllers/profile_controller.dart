import 'package:get/get.dart';
import 'package:shopping_store/app/data/models/user.dart';

class ProfileController extends GetxController {
  var mainUser = User().obs;
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  getUser() {
    User user = User(
      id: 1,
      firstname: "John",
      middleName: "who",
      lastname: "Doe",
      username: "john.doe",
      email: "john.doe@email.com",
      password: "tgXf=SgNVs7HR#_6+u!5",
      phoneNumber: "00212678796453",
      imageUrl:
          "https://cdn.dribbble.com/users/699610/avatars/normal/f692961e526daf39d8f15cb6a0c176aa.png",
      gender: "male",
      profileCompleted: true,
      receiveNotification: true,
      emailVerified: true,
    );
    mainUser.value = user;
  }
}
