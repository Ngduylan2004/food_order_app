import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/dashboard/grocery_enum.dart';
import 'package:food_order_app/features/grocery/presentation/pages/grocery_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> groceryRouter = [
  GoRoute(
    path: GroceryEnum.grocery.path,
    name: GroceryEnum.grocery.name,
    builder: (BuildContext context, GoRouterState state) {
      return const GroceryScreen();
    },
  ),
];
