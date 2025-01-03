import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/theme/colors/theme_color.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:go_router/go_router.dart';

class Step05 extends StatelessWidget {
  const Step05({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Lastly, how skilled are\nyou in the kitchen?',
              style: context.heading4Style,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8),
            Text(
              'This will help us curate more recipe\nexperiences for you.',
              style: context.bodyLarge500Style?.copyWith(
                  color: const Color(0xFF354D35), fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 8, // Khoảng cách giữa các phần tử
              runSpacing: 8, // Khoảng cách giữa các dòng
              alignment:
                  WrapAlignment.start, // Căn chỉnh các phần tử theo chiều ngang
              children: [
                AppOulineButton(
                  text: 'Beginner',
                  icon: Icons.check_circle_outline,
                ),
                AppOulineButton(
                  text: 'Intermediate',
                  icon: Icons.check_circle,
                ),
                AppOulineButton(
                  text: 'Advanced',
                  icon: Icons.check_circle,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Others (Please Specify)',
              style: context.bodyLarge500Style?.copyWith(
                  color: ThemeColor.black, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 205,
              height: 40,
              child: TextField(
                style: context.bodyLarge500Style?.copyWith(
                  color: ThemeColor.lightBlack,
                  fontSize:
                      14, // Kích thước chữ trong TextField (nội dung người dùng nhập vào)
                ),
                decoration: InputDecoration(
                  labelText: 'Other',
                  labelStyle: context.bodySmall500Style?.copyWith(
                    color: ThemeColor.lightBlack,
                    fontSize: 12, // Kích thước chữ trong labelText
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10), // Điều chỉnh khoảng cách trong TextField
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: ThemeColor.lightGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: ThemeColor.primary),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 150),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<RegisterBloc>()
                          .add(RegisterStepBackEvent(step: 3));
                    },
                    child: const AppOulineButton(
                      width: 150,
                      height: 52,
                      text: 'Previous',
                    ),
                  ),
                  AppSolidButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: ThemeColor.white,
                          child: SizedBox(
                            width: 335,
                            height: 367,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/image/icons/susscecs.png',
                                      width: 123, height: 69),
                                  Text(
                                    'Sign up successful!',
                                    style: context.heading5Style,
                                    textAlign:
                                        TextAlign.center, // Căn giữa text
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Your account has been created. Please wait a moment, we are preparing for you...',
                                    style: context.bodyLarge500Style?.copyWith(
                                        color: const Color(0xFF354D35),
                                        fontWeight: FontWeight.w400),
                                    textAlign:
                                        TextAlign.center, // Căn giữa text
                                  ),
                                  const SizedBox(height: 16),
                                  AppSolidButton(
                                    width: 289,
                                    height: 52,
                                    onPressed: () {
                                      context.goNamed('dashboard');
                                    },
                                    text: 'Redirecting...',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    width: 150,
                    height: 52,
                    text: 'Complete',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
