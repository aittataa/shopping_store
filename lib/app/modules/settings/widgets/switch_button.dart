import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shopping_store/app/config/themes/app_theme.dart';

class SwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool) onToggle;
  const SwitchButton({Key? key, required this.value, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: FlutterSwitch(
        onToggle: onToggle,
        value: value,
        borderRadius: 25,
        padding: 5,
        activeColor: AppTheme.mainColor,
        inactiveColor: AppTheme.secondaryBackColor,
      ),
    );
  }
}
