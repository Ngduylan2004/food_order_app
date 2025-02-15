import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';

class Step03 extends StatelessWidget {
  const Step03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Do you have any dietary\nrestrictions?',
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
            const AppOulineButton(text: 'None'),
            const AppOulineButton(text: 'Vegan'),
            const AppOulineButton(text: 'Vegetarian'),
            const AppOulineButton(text: 'Gluten-Free'),
            const AppOulineButton(text: 'Halal'),
            const AppOulineButton(text: 'Kosher'),
            const AppOulineButton(text: 'Keto'),
            const AppOulineButton(text: 'Paleo'),
            const AppOulineButton(text: 'Pescatarian'),
            const AppOulineButton(text: 'Primal'),
            const AppOulineButton(text: 'Vegan'),
          ].map((button) {
            return IntrinsicWidth(
              child: button,
            );
          }).toList(),
        ),
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
                    context
                        .read<RegisterBloc>()
                        .add(RegisterStepEvent(step: 3));
                  },
                  width: 150,
                  height: 52,
                  text: 'Next Step',
                ),
              ],
            );
          },
        ),
      ],
    ));
  }
}
