import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class SwipeButton extends StatelessWidget {
  final String route;
  final String? label;
  final String? title;
  const SwipeButton({Key? key, required this.route, this.label, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      title: GestureDetector(
        onTap: () => Get.offAllNamed(route),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "$label",
              minFontSize: 12,
              maxFontSize: 20,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.primaryTextColor.withOpacity(.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            AutoSizeText(
              "$title",
              minFontSize: 14,
              maxFontSize: 20,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.primaryTextColor.withOpacity(.75),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
