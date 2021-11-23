import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/functions/app_function.dart';
import 'package:shopping_store/app/config/messages/app_message.dart';
import 'package:shopping_store/app/config/responses/app_response.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';
import 'package:shopping_store/app/data/models/user.dart';
import 'package:shopping_store/app/modules/login/controllers/login_controller.dart';
import 'package:shopping_store/app/modules/login/widgets/access_button.dart';
import 'package:shopping_store/app/modules/login/widgets/checked_box.dart';
import 'package:shopping_store/app/routes/app_pages.dart';
import 'package:shopping_store/app/shared/edit_button.dart';
import 'package:shopping_store/app/shared/expanded_picture.dart';
import 'package:shopping_store/app/shared/field_text.dart';
import 'package:shopping_store/app/shared/progress_bar.dart';
import 'package:shopping_store/app/shared/swipe_button.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController(
    text: "mr.robot@anonymous.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "1234567890qwertyuiop",
  );

  late bool inAsyncCall = false;

  late bool rememberMe = true;

  late bool isEmail = false;
  late bool isPassword = false;
  late bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: inAsyncCall,
      opacity: .5,
      child: Scaffold(
        bottomNavigationBar: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            title: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                AppMessage.accessText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.primaryTextColor.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AccessButton(
                    image: AppMessage.facebookIcon,
                    onPressed: () => {Get.offAllNamed(Routes.INITIAL)},
                  ),
                  AccessButton(
                    image: AppMessage.googleIcon,
                    onPressed: () => {Get.offAllNamed(Routes.INITIAL)},
                  ),
                ],
              ),
            ),
          ),
          subtitle: SwipeButton(
            route: Routes.REGISTER,
            label: AppMessage.loginLabel,
            title: AppMessage.loginTitle,
          ),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ExpandedPicture(image: AppMessage.userPlaceHolder),
              ),
              Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 5,
                    title: FieldText(
                      onChanged: (String value) {
                        setState(() {
                          isEmail = AppFunction.isEmailValid(value.trim());
                        });
                      },
                      controller: emailController,
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
                      controller: passwordController,
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    minVerticalPadding: 0,
                    leading: CheckedBox(
                      onTap: () {
                        setState(() => {rememberMe = !rememberMe});
                      },
                      state: rememberMe,
                    ),
                    title: Text(
                      AppMessage.rememberMe,
                      style: TextStyle(
                        color: AppTheme.primaryTextColor.withOpacity(.75),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    trailing: Text(
                      AppMessage.forgetPassword,
                      style: TextStyle(
                        color: AppTheme.primaryTextColor.withOpacity(.75),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    minVerticalPadding: 0,
                    title: EditButton(
                      controller: controller,
                      label: AppMessage.loginButtonText,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        isEmail = emailController.text.trim().isNotEmpty;
                        isPassword = passwordController.text.trim().isNotEmpty;
                        if (isEmail && isPassword) {
                          /// TODO : Start Indicator
                          setState(() => {inAsyncCall = true});
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          AppResponse appResponse = await controller.loginUser(
                            User(email: email, password: password),
                          );
                          //final Users users = appResponse.response;
                          if (appResponse.success) {
                            AppResponse.mainUser = appResponse.response;
                            //AppFunction.snackBar(
                            //  title: AppResponse.mainUser.email!,
                            //  message: appResponse.response.email,
                            //);
                            Get.offAllNamed(Routes.INITIAL);
                          } else {
                            AppFunction.snackBar(
                              title: "Authentication Error",
                              message: "Please check your email and password",
                            );
                          }
                        } else {
                          AppFunction.snackBar(
                            title: "Fields required",
                            message: "Please type your email and password",
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
    );
  }
}

//loginUser(String email, String password) async {
//  final LoginController controller = Get.put(LoginController());
//  bool isEmail = AppFunction.isEmailValid(email);
//  bool isPassword = AppFunction.isPasswordValid(password);
//  if (isEmail && isPassword) {
//    final User user = User(email: email, password: password);
//    return await controller.loginUser(user);
//  }
//}
//{"email":"jon.snow@king.com","password":"$2b$10$K9LGy38jzVfZ4/uSreXjuOu.TatrM3jkHYClqjvF8KgIkue.mg83S"}
//{"email":"aittata.abderrahim@httpsandcom.com","password":r"$2b$10$LY.0AryH2GGGIbv50h4SnOzZELo4naehOkspPcqUpak4qq7YZFrOe"}
//{"email":"john.doe@httpsandcom.com","password":r"$2b$10$KerVRdAxcA/ChKcMZRDSNOFHZdYIIaZs57gNBWm5MCut54xKkx71i"}
