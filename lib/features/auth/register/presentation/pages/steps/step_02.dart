import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';

class Step02 extends StatelessWidget {
  const Step02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do you have any\nallergies or dislikes?',
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
            Wrap(
              spacing: 10, // Khoảng cách giữa các phần tử
              runSpacing: 8, // Khoảng cách giữa các dòng
              alignment:
                  WrapAlignment.start, // Căn chỉnh các phần tử theo chiều ngang
              children: [
                const AppOulineButton(text: 'Shrimp'),
                const AppOulineButton(text: 'Carrot'),
                const AppOulineButton(text: 'Mushroom'),
                const AppOulineButton(text: 'Onion'),
                const AppOulineButton(text: 'Bell Pepper'),
                const AppOulineButton(text: 'Garlic'),
                const AppOulineButton(text: 'Apple'),
                const AppOulineButton(text: 'Eggplant'),
              ].map((button) {
                return IntrinsicWidth(
                  child: button,
                );
              }).toList(),
            ),
            const SizedBox(height: 200),
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
                            .add(RegisterStepBackEvent(step: 1));
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
                            .add(RegisterStepEvent(step: 2));
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
        ),
      ),
    );
  }
}
