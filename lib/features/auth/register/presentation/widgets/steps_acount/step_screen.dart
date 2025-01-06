import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';

class StepScreen extends StatelessWidget {
  final String step;

  const StepScreen({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        // Optional: Handle side-effects like showing snackbars here
      },
      builder: (context, state) {
        if (state is RegisterStep) {
          // Kiểm tra nếu bước này là bước hiện tại
          bool isCurrentStep = state.step == int.parse(step);

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isCurrentStep
                  ? ThemeColor.primary // Màu nếu là bước hiện tại
                  : ThemeColor.white, // Màu khác nếu không phải bước hiện tại
              border: Border.all(
                color:
                    isCurrentStep ? ThemeColor.primary : ThemeColor.lightBlack,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              step,
              style: context.bodyLarge500Style?.copyWith(
                fontSize: 14,
                color: isCurrentStep
                    ? ThemeColor.white // Màu chữ nếu là bước hiện tại
                    : ThemeColor
                        .black, // Màu chữ khác nếu không phải bước hiện tại
              ),
            ),
          );
        }
        return const SizedBox.shrink(); // Trả về widget rỗng nếu không có state
      },
    );
  }
}
