import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';

class Step01 extends StatelessWidget {
  const Step01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'Whats your preferred ',
                style: context.heading4Style,
                children: [
                  TextSpan(
                    text: '\nlanguage for the app?',
                    style: context.heading4Style,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimens.marginVertical),
            Text(
              'Select the language that youd prefer to use while exploring Recipe Passport.',
              style: context.bodyLarge500Style?.copyWith(
                  color: const Color(0xFF354D35), fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: Dimens.marginVerticalMedium),
            const Wrap(
              spacing: 5, // Khoảng cách giữa các phần tử
              runSpacing: 8, // Khoảng cách giữa các dòng
              alignment:
                  WrapAlignment.start, // Căn chỉnh các phần tử theo chiều ngang
              children: [
                AppOulineButton(
                  text: 'English',
                  icon: Icons.check_circle_outline,
                ),
                AppOulineButton(
                  text: 'Spanish',
                  icon: Icons.check_circle,
                ),
                AppOulineButton(
                  text: 'French',
                  icon: Icons.check_circle,
                )
              ],
            ),
            const SizedBox(height: Dimens.marginVerticalMedium),
            Text(
              'Others (Please Specify)',
              style: context.bodyLarge500Style?.copyWith(
                  color: ThemeColor.black, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: Dimens.marginVertical),
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
            const SizedBox(height: 150),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Center(
                  child: AppSolidButton(
                    onPressed: () {
                      context
                          .read<RegisterBloc>()
                          .add(RegisterStepEvent(step: 1));
                    },
                    width: double.infinity,
                    height: 52,
                    text: 'Next Step',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
