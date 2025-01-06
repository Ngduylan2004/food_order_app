import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/steps/step_01.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/steps/step_02.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/steps/step_03.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/steps/step_04.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/steps/step_05.dart';
import 'package:food_order_app/features/auth/register/presentation/widgets/steps_acount/step_screen.dart';
import 'package:go_router/go_router.dart';

class RegisterStepsScreen extends StatefulWidget {
  const RegisterStepsScreen({super.key});

  @override
  State<RegisterStepsScreen> createState() => _RegisterStepsScreenState();
}

class _RegisterStepsScreenState extends State<RegisterStepsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc()..add(RegisterStepEvent(step: 0)),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingHorizontal,
              vertical: Dimens.paddingVerticalStep),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      StepScreen(
                        step: '1',
                      ),
                      SizedBox(width: 8),
                      StepScreen(
                        step: '2',
                      ),
                      SizedBox(width: 8),
                      StepScreen(
                        step: '3',
                      ),
                      SizedBox(width: 8),
                      StepScreen(
                        step: '4',
                      ),
                      SizedBox(width: 8),
                      StepScreen(
                        step: '5',
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context.goNamed('login');
                    },
                    child: Text(
                      'Skip',
                      style: context.bodyLarge500Style?.copyWith(
                        color: ThemeColor.red,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: Dimens.marginVerticalMedium),
              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is RegisterStep) {
                    return Expanded(
                      child: _buildStepContent(state.step),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(int steps) {
    switch (steps) {
      case 1:
        return const Step01();
      case 2:
        return const Step02();
      case 3:
        return const Step03();
      case 4:
        return const Step04();
      case 5:
        return const Step05();
      default:
        return const Center(child: Text('Invalid Step'));
    }
  }

  // Hàm để chuyển sang bước tương ứng khi người dùng nhấn vào số bước
  // void _onStepTapped(int step) {
  //   setState(() {
  //     currentStep = step;
  //   });
  // }
}
