import 'package:flutter/material.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';

class AppOulineButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? width;
  final double? height;
  final bool isActive;
  final void Function()? onPressed;

  const AppOulineButton({
    this.isActive = false,
    super.key,
    required this.text,
    this.icon,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: icon == null
            ? Text(text,
                style: context.bodyRegular500Style
                    ?.copyWith(color: ThemeColor.black))
            : Row(
                mainAxisSize:
                    MainAxisSize.min, // giới hạn kích thước của button
                children: [
                  Text(text,
                      style: context.bodyRegular500Style
                          ?.copyWith(color: ThemeColor.black)),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(icon,
                      color: isActive == true
                          ? ThemeColor.primary
                          : ThemeColor.lightGray),
                ],
              ),
      ),
    );
  }
}
