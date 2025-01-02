import 'package:flutter/material.dart';
import 'package:food_order_app/core/theme/colors/theme_color.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';

class AuthTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String label;
  final bool obscureText;
  final Function onTap;

  const AuthTextFiled({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    required this.obscureText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: context.bodyRegular500Style?.copyWith(
            fontSize: 16,
            color: ThemeColor.lightBlack), // Đặt mặc định cho kiểu chữ nhập vào
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeColor.lightGray),
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeColor.primary),
            borderRadius: BorderRadius.circular(100),
          ),
          floatingLabelStyle: context.bodyRegular500Style?.copyWith(
            color: ThemeColor.primary,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          label: Text(label, style: context.bodyRegular500Style),
          alignLabelWithHint: true,
          prefixIcon: prefixIcon == null
              ? null
              : Icon(
                  prefixIcon,
                  color: ThemeColor.lightBlack,
                ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 50, // Độ rộng tối thiểu của icon (tăng để thụt vào)
          ),
          suffixIcon: suffixIcon == null
              ? null
              : GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Icon(suffixIcon, color: ThemeColor.lightBlack)),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 70, // Độ rộng tối thiểu của icon (tăng để thụt vào)
          ),
        ),
      ),
    );
  }
}
