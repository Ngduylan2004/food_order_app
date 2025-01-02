import 'package:flutter/material.dart';
import 'package:food_order_app/core/theme/colors/theme_color.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';

class ResetWidget extends StatelessWidget {
  final String text;
  const ResetWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: ThemeColor.primary, // Màu nền của vòng tròn
            shape: BoxShape.circle, // Hình dáng của Container là hình tròn
          ),
          padding: const EdgeInsets.all(0), // Khoảng cách giữa icon và viền
          child: const Icon(
            Icons.check_circle,
            color: Color.fromARGB(255, 237, 252, 239), // Màu của dấu tick
            size: 24,
          ),
        ),
        const SizedBox(width: 10),
        Text(text, style: context.bodySmall500Style),
      ],
    );
  }
}
