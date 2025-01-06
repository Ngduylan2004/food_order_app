import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/auth/login_enum.dart';
import 'package:food_order_app/core/enum/router_enum/auth/register_enum.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/check_email_screen.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/password_recovery_screen.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/reset_password_screen.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/register_screen.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/register_steps_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> authRouter = [
  GoRoute(
      path: RegisterEnum.register.path,
      name: RegisterEnum.register.name,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RegisterEnum.registerStep.path,
          name: RegisterEnum.registerStep.name,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterStepsScreen();
          },
        ),
      ]),
  GoRoute(
    path: LoginEnum.login.path,
    name: LoginEnum.login.name,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: LoginEnum.passwordRecovery.path,
        name: LoginEnum.passwordRecovery.name,
        builder: (BuildContext context, GoRouterState state) {
          return PasswordRecoveryScreen();
        },
      ),
      GoRoute(
        path: LoginEnum.checkEmail.path,
        name: LoginEnum.checkEmail.name,
        builder: (BuildContext context, GoRouterState state) {
          return const CheckEmailScreen();
        },
      ),
      GoRoute(
        path: LoginEnum.resetPassword.path,
        name: LoginEnum.resetPassword.name,
        builder: (BuildContext context, GoRouterState state) {
          return const ResetPasswordScreen();
        },
      )
    ],
  ),
];
