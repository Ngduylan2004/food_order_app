import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/check_email_screen.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/login_screen.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/password_recovery_screen.dart';
import 'package:food_order_app/features/auth/login/presentation/pages/reset_password_screen.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/register_screen.dart';
import 'package:food_order_app/features/auth/register/presentation/pages/register_steps_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> authRouter = [
  GoRoute(
      path: RouterEnum.register.path,
      name: RouterEnum.register.name,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouterEnum.registerStep.path,
          name: RouterEnum.registerStep.name,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterStepsScreen();
          },
        ),
      ]),
  GoRoute(
    path: RouterEnum.login.path,
    name: RouterEnum.login.name,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: RouterEnum.passwordRecovery.path,
        name: RouterEnum.passwordRecovery.name,
        builder: (BuildContext context, GoRouterState state) {
          return PasswordRecoveryScreen();
        },
      ),
      GoRoute(
        path: RouterEnum.checkEmail.path,
        name: RouterEnum.checkEmail.name,
        builder: (BuildContext context, GoRouterState state) {
          return const CheckEmailScreen();
        },
      ),
      GoRoute(
        path: RouterEnum.resetPassword.path,
        name: RouterEnum.resetPassword.name,
        builder: (BuildContext context, GoRouterState state) {
          return const ResetPasswordScreen();
        },
      )
    ],
  ),
];
