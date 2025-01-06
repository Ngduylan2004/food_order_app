import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';

class Step04 extends StatelessWidget {
  const Step04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Types of cuisines  you\nmost interested in?',
            style: context.heading4Style,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: Dimens.marginVertical),
          Text(
            'This will help us curate more recipe experiences for you.',
            style: context.bodyLarge500Style?.copyWith(
                color: const Color(0xFF354D35), fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: Dimens.marginVerticalSmall),
          Wrap(
            spacing: 8, // Khoảng cách giữa các phần tử
            runSpacing: 8, // Khoảng cách giữa các dòng
            alignment:
                WrapAlignment.start, // Căn chỉnh các phần tử theo chiều ngang
            children: [
              const AppOulineButton(text: 'European'),
              const AppOulineButton(text: 'African'),
              const AppOulineButton(text: 'Asian'),
              const AppOulineButton(text: 'Middle Eastern'),
              const AppOulineButton(text: 'Latin America'),
            ].map((button) {
              return IntrinsicWidth(
                child: button,
              );
            }).toList(),
          ),
          const SizedBox(height: 250),
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
                          .add(RegisterStepBackEvent(step: 4));
                    },
                    child: const AppOulineButton(
                      width: 150,
                      height: 52,
                      text: 'Previous',
                    ),
                  ),
                  AppSolidButton(
                    onPressed: () {
                      context
                          .read<RegisterBloc>()
                          .add(RegisterStepEvent(step: 4));
                    },
                    width: 150,
                    height: 52,
                    text: 'Get Started',
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
