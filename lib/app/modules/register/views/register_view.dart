import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/constants/app_constant.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/register/controllers/register_controller.dart';
import 'package:shopping_store/app/modules/register/widgets/picker_gender.dart';
import 'package:shopping_store/app/routes/app_pages.dart';
import 'package:shopping_store/app/shared/edit_button.dart';
import 'package:shopping_store/app/shared/expanded_picture.dart';
import 'package:shopping_store/app/shared/field_text.dart';
import 'package:shopping_store/app/shared/progress_bar.dart';
import 'package:shopping_store/app/shared/swipe_button.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController controller = Get.put(RegisterController());
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController password = TextEditingController();
  late Gender genderValue = Gender.Others;

  late bool inAsyncCall = false;

  late bool isFirstname = true;
  late bool isLastname = true;
  late bool isPhoneNumber = true;
  late bool isEmail = true;
  late bool isPassword = true;
  late bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: inAsyncCall,
      opacity: .5,
      child: Scaffold(
        bottomNavigationBar: SwipeButton(
          route: Routes.LOGIN,
          label: AppMessage.registerLabel,
          title: AppMessage.registerTitle,
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ExpandedPicture(
                  image: AppMessage.userPlaceHolder,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBackColor.withOpacity(.75),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      splashColor: AppTheme.transparentColor,
                      highlightColor: AppTheme.transparentColor,
                      icon: Icon(
                        CupertinoIcons.camera_fill,
                        color: AppTheme.mainColor,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title: Row(
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title: FieldText(
                        onChanged: (value) {
                          setState(() {
                            isEmail = AppFunction.isEmailValid(value);
                          });
                        },
                        controller: emailAddress,
                        state: isEmail,
                        icon: CupertinoIcons.mail_solid,
                        hint: AppMessage.hintEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      subtitle: FieldText(
                        onChanged: (String value) {
                          setState(() {
                            isPassword = AppFunction.isPasswordValid(value.trim());
                          });
                        },
                        controller: password,
                        state: isPassword,
                        icon: CupertinoIcons.lock_shield_fill,
                        hint: AppMessage.hintPassword,
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title: PickerGender(
                        onChanged: (value) {
                          genderValue = value!;
                        },
                      ),
                    ),

                    /// TODO : Create New Account
                    ListTile(
                      contentPadding: EdgeInsets.all(25),
                      minVerticalPadding: 0,
                      subtitle: EditButton(
                        controller: controller,
                        label: AppMessage.registerButtonText,
                        onPressed: () async {
                          /// TODO : Start Indicator
                          setState(() => {inAsyncCall = true});

                          String firstname = firstName.text.trim();
                          String lastname = lastName.text.trim();
                          String username = firstName.text + '.' + lastName.text;
                          String phone = phoneNumber.text.trim();
                          String email = emailAddress.text.trim();
                          String passWord = password.text.trim();
                          String gender = AppConstant.genderType[genderValue.index];
                          AppResponse appResponse = await controller.registerUser(
                            User(
                              firstname: firstname,
                              lastname: lastname,
                              username: username,
                              phoneNumber: phone,
                              email: email,
                              password: passWord,
                              gender: gender,
                            ),
                          );
                          if (appResponse.success) {
                            AppResponse.mainUser = appResponse.response;
                            Get.offAllNamed(Routes.INITIAL);
                          } else {
                            AppFunction.snackBar(
                              title: appResponse.messageUser.toString(),
                              message: appResponse.messageUser.toString(),
                            );
                          }

                          /// TODO : End Indicator
                          setState(() => {inAsyncCall = false});
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
