import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> profileRouter = [
  GoRoute(
    path: RouterEnum.profile.path,
    name: RouterEnum.profile.name,
    builder: (BuildContext context, GoRouterState state) {
      return ProfileScreen();
    },
  ),
];
