import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/profile/controllers/profile_controller.dart';
import 'package:shopping_store/app/modules/profile/widgets/text_box.dart';
import 'package:shopping_store/app/shared/back_icon.dart';
import 'package:shopping_store/app/shared/edit_button.dart';

class ProfileView extends StatefulWidget {
  final User? user;
  const ProfileView({Key? key, this.user}) : super(key: key);
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController controller = Get.put(ProfileController());
  late bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(onPressed: () => Get.back()),
        title: Text(AppMessage.labelProfile),
        centerTitle: true,
      ),
      body: Obx(() {
        final User user = controller.mainUser.value;
        return SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              /// TODO : Profile Picture
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBackColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    scale: .5,
                    image: CachedNetworkImageProvider(user.imageUrl!),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppTheme.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            splashColor: AppTheme.transparentColor,
                            highlightColor: AppTheme.transparentColor,
                            icon: Icon(
                              CupertinoIcons.camera_fill,
                              color: AppTheme.secondaryIconColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// TODO : About Name
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: Row(
                  children: [
                    Expanded(
                      child: TextBox(
                        controller: TextEditingController(text: user.firstname),
                        hint: "Firstname",
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Expanded(
                      child: TextBox(
                        controller:
                            TextEditingController(text: user.middleName),
                        hint: "Middlename",
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                subtitle: TextBox(
                  controller: TextEditingController(text: user.lastname),
                  hint: "Lastname",
                  keyboardType: TextInputType.name,
                ),
              ),

              /// TODO : Phone Number
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: TextBox(
                  controller: TextEditingController(text: user.phoneNumber),
                  hint: "Phone Number",
                  keyboardType: TextInputType.phone,
                ),
              ),

              /// TODO : About Password
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: TextBox(
                  controller: TextEditingController(text: user.password),
                  hint: "Password",
                  obscureText: obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => {obscureText = !obscureText});
                    },
                    icon: Icon(
                      CupertinoIcons.eye_solid,
                      color: obscureText
                          ? AppTheme.mainColor
                          : AppTheme.primaryIconColor.withOpacity(.5),
                    ),
                  ),
                ),
              ),

              /// TODO : Delete Account Bar
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                minVerticalPadding: 0,
                title: EditButton(
                  onPressed: () {},
                  controller: controller,
                  label: AppMessage.saveProfile,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
