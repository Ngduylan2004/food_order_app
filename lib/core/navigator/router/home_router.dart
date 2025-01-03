import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/features/home/presentation/pages/home_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> homeRouter = [
  GoRoute(
    path: RouterEnum.home.path,
    name: RouterEnum.home.name,
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
];
