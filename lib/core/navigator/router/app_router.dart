import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/core/navigator/router/auth_router.dart';
import 'package:food_order_app/core/navigator/router/dashboard_router.dart';
import 'package:food_order_app/features/introduction/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouterEnum.splash.path, // Trang mặc định là SplashScreen
  routes: <RouteBase>[
    GoRoute(
      path: RouterEnum.splash.path,
      name: RouterEnum.splash.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen(); // Điều hướng đến SplashScreen
      },
    ),
    ...authRouter,
    ...dashboardRouter,
  ],
);
