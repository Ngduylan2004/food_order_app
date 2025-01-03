import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/features/explore/presentation/pages/explore_screen.dart';
import 'package:food_order_app/features/explore/presentation/pages/recipe_category_screen.dart';
import 'package:food_order_app/features/explore/presentation/pages/sup_category_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> exploreRouter = [
  GoRoute(
    path: RouterEnum.explore.path,
    name: RouterEnum.explore.name,
    builder: (BuildContext context, GoRouterState state) {
      return ExploreScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: RouterEnum.category.path,
        name: RouterEnum.category.name,
        builder: (BuildContext context, GoRouterState state) {
          return const RecipeCategoryScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouterEnum.supCategory.path,
            name: RouterEnum.supCategory.name,
            builder: (BuildContext context, GoRouterState state) {
              return const SupCategoryScreen();
            },
          ),
        ],
      )
    ],
  ),
];
