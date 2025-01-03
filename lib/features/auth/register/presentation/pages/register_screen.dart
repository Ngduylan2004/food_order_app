import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/component/social/social.dart';
import 'package:food_order_app/core/component/textFiled/auth_text_filed.dart';
import 'package:food_order_app/core/theme/colors/theme_color.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/register_steps_screen.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 120.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Welcome to Recipe ',
                          style: context.heading4Style,
                          children: [
                            TextSpan(
                              text: '\nPassport App',
                              style: context.heading4Style,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),

                      Text('Please enter your account details below!',
                          style: context.bodyLarge500Style?.copyWith(
                            color: ThemeColor.lightBlack,
                          )),
                      const SizedBox(height: 24),

                      AuthTextFiled(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full Name không được để trống';
                          }
                          return null;
                        },
                        onTap: () {},
                        obscureText: false,
                        controller: fullNameController,
                        label: 'Full Name',
                        prefixIcon: Icons.person,
                      ),
                      const SizedBox(height: 16),
                      AuthTextFiled(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email không được để trống';
                          }
                          return null;
                        },
                        onTap: () {},
                        obscureText: false,
                        controller: emailController,
                        label: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 16),
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
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: ThemeColor.primary,
                            checkColor: ThemeColor.white,
                          ),
                          InkWell(
                            onTap: () {
                              context.goNamed('dashboard');
                            },
                            child: Text('Accept terms & Condition ',
                                style: context.bodySmall500Style?.copyWith(
                                  color: ThemeColor.primary,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterStepsScreen(),
                                ),
                              );
                            },
                            child: Text('step nhanh ',
                                style: context.bodySmall500Style?.copyWith(
                                  color: ThemeColor.primary,
                                )),
                          ),
                        ],
                      ),
                      if (state is RegisterLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),

                      // BlocListener lắng nghe và điều hướng
                      BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterSuccess) {
                            context.goNamed('register-step');
                          }
                          if (state is RegisterError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: ThemeColor.red,
                            ));
                          }
                        },
                        child: const SizedBox(),
                      ),

                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.center,
                        child: AppSolidButton(
                          width: double.infinity,
                          height: 52,
                          text: 'Continue',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                              context.read<RegisterBloc>().add(
                                    RegisterEventNextStep(
                                      fullName: fullNameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: ThemeColor.lightBlack,
                                  thickness: 0.2,
                                  indent: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Or continue with',
                                style: context.bodySmall500Style?.copyWith(
                                  color: ThemeColor.lightBlack,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Divider(
                                  color: ThemeColor.lightBlack,
                                  thickness: 0.2,
                                  endIndent: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            image: 'assets/image/icons/gg.png',
                            text: 'Google',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 16),
                          SocialButton(
                            image: 'assets/image/icons/facebook.png',
                            text: 'Facebook',
                            onPressed: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 50),
                      InkWell(
                        onTap: () {
                          context.goNamed('login');
                        },
                        child: Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Already have account with us? ',
                                style: context.bodyRegular500Style?.copyWith(
                                  color: ThemeColor.lightBlack,
                                )),
                            TextSpan(
                              text: 'SignIn',
                              style: context.bodyRegular500Style
                                  ?.copyWith(color: ThemeColor.primary),
                            )
                          ])),
                        ),
                      )
                    ],
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
