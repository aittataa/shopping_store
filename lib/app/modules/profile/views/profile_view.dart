import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/initial/views/initial_view.dart';
import 'package:shopping_store/app/modules/profile/controllers/profile_controller.dart';
import 'package:shopping_store/app/shared/back_icon.dart';
import 'package:shopping_store/app/shared/edit_button.dart';
import 'package:shopping_store/app/shared/expanded_picture.dart';
import 'package:shopping_store/app/shared/field_text.dart';
import 'package:shopping_store/app/shared/progress_bar.dart';

class ProfileView extends StatefulWidget {
  final User? user;
  const ProfileView({Key? key, this.user}) : super(key: key);
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController controller = Get.put(ProfileController());
  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController middleName = TextEditingController();
  late TextEditingController phoneNumber = TextEditingController();

  late User user;

  late bool inAsyncCall = false;

  late bool isFirstname = true;
  late bool isLastname = true;
  late bool isPhoneNumber = true;

  @override
  void initState() {
    super.initState();
    user = widget.user!;
    firstName = TextEditingController(text: user.firstname);
    lastName = TextEditingController(text: user.lastname);
    middleName = TextEditingController(text: user.middlename);
    phoneNumber = TextEditingController(text: user.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: inAsyncCall,
      opacity: .5,
      child: Scaffold(
        appBar: AppBar(
          leading: BackIcon(onPressed: () => Get.back()),
          title: Text(AppMessage.labelProfile),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              /// TODO : Profile Picture
              ExpandedPicture(
                image: AppMessage.userPlaceHolder,
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

              /// TODO : Display Email
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: FieldText(
                  controller: TextEditingController(text: user.email),
                  icon: CupertinoIcons.mail_solid,
                  hint: AppMessage.hintEmail,
                  enabled: false,
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: FieldText(
                        onChanged: (String value) {
                          setState(() {
                            isFirstname = AppFunction.isNameValid(value.trim());
                          });
                        },
                        controller: firstName,
                        state: isFirstname,
                        icon: CupertinoIcons.person_alt_circle_fill,
                        hint: AppMessage.hintFirstname,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Expanded(
                      child: FieldText(
                        onChanged: (String value) {
                          setState(() {
                            isLastname = AppFunction.isNameValid(value.trim());
                          });
                        },
                        controller: lastName,
                        state: isLastname,
                        hint: AppMessage.hintLastname,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),

              /// TODO : About Name And Phone Number
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: FieldText(
                  controller: middleName,
                  icon: CupertinoIcons.person_fill,
                  hint: AppMessage.hintMiddlename,
                  keyboardType: TextInputType.name,
                ),
                subtitle: FieldText(
                  onChanged: (String value) {
                    setState(() {
                      isPhoneNumber = GetUtils.isPhoneNumber(value.trim());
                    });
                  },
                  controller: phoneNumber,
                  state: isPhoneNumber,
                  icon: CupertinoIcons.phone_fill,
                  hint: AppMessage.hintPhone,
                  keyboardType: TextInputType.phone,
                ),
              ),

              /// TODO : Update Account
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                minVerticalPadding: 0,
                title: EditButton(
                  controller: controller,
                  label: AppMessage.saveProfile,
                  onPressed: () async {
                    setState(() => {inAsyncCall = true});
                    String firstname = firstName.text.trim();
                    String lastname = lastName.text.trim();
                    String middlename = middleName.text.trim();
                    String phone = phoneNumber.text.trim();
                    AppResponse appResponse = await controller.updateUser(
                      User(
                        id: user.id,
                        firstname: firstname,
                        lastname: lastname,
                        middlename: middlename,
                        phoneNumber: phone,
                      ),
                    );
                    if (appResponse.success) {
                      AppResponse.mainUser = appResponse.response;
                      Get.offAll(InitialView(id: 3));
                    } else {
                      AppFunction.snackBar(
                        title: appResponse.messageUser.toString(),
                        message: appResponse.messageUser.toString(),
                      );
                    }
                    setState(() => {inAsyncCall = false});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
