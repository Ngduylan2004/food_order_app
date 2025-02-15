import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/component/social/social.dart';
import 'package:food_order_app/core/component/textFiled/auth_text_filed.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
// import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          bool isLoading = state is LoginLoading;
          return LoadingOverlay(
            isLoading: isLoading,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.paddingHorizontal,
                        vertical: Dimens.paddingVertical),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome Back! 😊🤗🤗',
                            style: context.heading4Style),
                        const SizedBox(height: Dimens.marginVertical),
                        Text('Please enter your account details below!',
                            style: context.bodyLarge500Style
                                ?.copyWith(color: ThemeColor.lightBlack)),
                        const SizedBox(height: Dimens.marginVerticalLarge),
                        AuthTextFiled(
                          onTap: () {},
                          obscureText: false,
                          controller: emailController,
                          label: 'Email',
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                    .hasMatch(value)) {
                              return 'Email không đúng định dạng';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: Dimens.marginHorizontalSmall),
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
                          controller: passwordController,
                          label: 'Password',
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.visibility_outlined,
                          obscureText: isPassword,
                        ),
                        const SizedBox(height: Dimens.marginVerticalSmall),
                        Align(
                          alignment: Alignment.centerRight, // Căn phải
                          child: InkWell(
                            onTap: () {
                              context.goNamed('password-recovery');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: context.bodyRegular500Style?.copyWith(
                                  color: ThemeColor.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess ||
                                state is LoginGoogleSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: ThemeColor.primary,
                                      content: Text('Đăng nhập thành công')));
                              context.goNamed('dashboard');
                            } else if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: ThemeColor.red,
                                      content:
                                          Center(child: Text(state.message))));
                            }
                          },
                          child: const SizedBox(),
                        ),
                        const SizedBox(height: Dimens.marginHorizontalMedium),
                        AppSolidButton(
                          width: double.infinity,
                          height: 55,
                          text: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                              context.read<LoginBloc>().add(LoginEmailEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                        ),
                        const SizedBox(height: Dimens.marginHorizontalMedium),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Đường kẻ ngang trước text
                                const Expanded(
                                  child: Divider(
                                    color: Colors.black, // Màu đường kẻ
                                    thickness: 0.2, // Độ dày đường kẻ
                                    indent: 20, // Khoảng cách từ trái
                                  ),
                                ),
                                const SizedBox(width: Dimens.marginHorizontal),
                                // Text
                                Text(
                                  'Or login in with',
                                  style: context.bodySmall500Style?.copyWith(
                                      color: ThemeColor
                                          .lightBlack), // Sử dụng style của bạn tại đây
                                ),
                                const SizedBox(width: 10),
                                // Đường kẻ ngang sau text
                                const Expanded(
                                  child: Divider(
                                    color: Colors.black, // Màu đường kẻ
                                    thickness: 0.2, // Độ dày đường kẻ
                                    endIndent: 20, // Khoảng cách từ phải
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: Dimens.marginVerticalMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(
                              image: 'assets/image/icons/gg.png',
                              text: 'Google',
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginGoogleEvent());
                              },
                            ),
                            const SizedBox(width: Dimens.marginHorizontalSmall),
                            SocialButton(
                              image: 'assets/image/icons/facebook.png',
                              text: 'Facebook',
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 150),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'Don\'t have account with us? ', // Văn bản không nhấn
                              style: context.bodyLarge500Style
                                  ?.copyWith(color: ThemeColor.lightBlack),
                              children: [
                                TextSpan(
                                  text: 'SignUp', // Văn bản có thể nhấn
                                  style: context.bodyRegular500Style
                                      ?.copyWith(color: ThemeColor.primary),
                                  // Chuyển hướng khi nhấn recognizer có thể nhấn
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go(
                                          '/register'); // Chuyển hướng khi nhấn
                                    },
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
