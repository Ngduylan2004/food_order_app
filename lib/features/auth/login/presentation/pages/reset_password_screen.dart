import 'package:flutter/material.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/component/textFiled/auth_text_filed.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/login/presentation/widgets/reset_widget/reset_widget.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reset your password', style: context.heading4Style),
              const SizedBox(height: 10),
              Text('Please enter your new password',
                  style: context.bodyLarge500Style
                      ?.copyWith(color: ThemeColor.lightBlack)),
              const SizedBox(height: 48),
              AuthTextFiled(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password không được để trống';
                  } else if (value.length < 8) {
                    return 'Password phải có ít nhất 8 ký tự';
                  }
                  return null;
                },
                onTap: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                obscureText: isPassword,
                controller: passwordController,
                label: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_outlined,
              ),
              const SizedBox(height: 24),
              const ResetWidget(text: 'At least 8 characters'),
              const SizedBox(height: 10),
              const ResetWidget(text: 'Contains a number'),
              const SizedBox(height: 10),
              const ResetWidget(text: 'Contains a special character'),
              const SizedBox(height: 24),
              AppSolidButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: ThemeColor.white,
                      child: SizedBox(
                        width: 500,
                        height: 367,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/image/icons/susscecs.png',
                                    width: 123, height: 69),
                                const SizedBox(height: 16),
                                Text(
                                  'Password reset successful!',
                                  style: context.heading5Style,
                                  textAlign: TextAlign.center, // Căn giữa text
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Your password has been successfully changed.',
                                  style: context.bodySmall500Style,
                                  textAlign: TextAlign.center, // Căn giữa text
                                ),
                                const SizedBox(height: 16),
                                AppSolidButton(
                                  width: 289,
                                  height: 52,
                                  onPressed: () {
                                    context.goNamed('login');
                                  },
                                  text: 'SignIn',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                width: double.infinity,
                height: 52,
                text: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
