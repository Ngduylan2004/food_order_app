import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/component/textFiled/auth_textFiled.dart';
import 'package:food_order_app/core/theme/colors/theme_color.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class PasswordRecoveryScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Password Recovery', style: context.heading4Style),
                const SizedBox(height: 10),
                Text(
                    'Please enter the email you registered with to recover password',
                    style: context.bodyLarge500Style
                        ?.copyWith(color: ThemeColor.lightBlack)),
                const SizedBox(height: 70),
                AuthTextFiled(
                  onTap: () {},
                  obscureText: false,
                  controller: emailController,
                  label: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 24),
                BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
                  if (state is LoginResetPasswordSuccess) {
                    context.goNamed('login');
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: ThemeColor.red,
                        content: Center(child: Text(state.message))));
                  }
                }, builder: (context, state) {
                  return AppSolidButton(
                    onPressed: () {
                      // context.read<LoginBloc>().add(
                      //     LoginResetPasswordEvent(email: emailController.text));
                      context.goNamed('reset-password');
                    },
                    width: double.infinity,
                    height: 52,
                    text: 'Send',
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
