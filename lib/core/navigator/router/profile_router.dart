import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/dashboard/profile_enum.dart';
import 'package:food_order_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> profileRouter = [
  GoRoute(
    path: ProfileEnum.profile.path,
    name: ProfileEnum.profile.name,
    builder: (BuildContext context, GoRouterState state) {
      return ProfileScreen();
    },
  ),
];
