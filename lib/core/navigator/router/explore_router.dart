import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/dashboard/explore_enum.dart';
import 'package:food_order_app/features/explore/presentation/pages/explore_screen.dart';
import 'package:food_order_app/features/explore/presentation/pages/recipe_category_screen.dart';
import 'package:food_order_app/features/explore/presentation/pages/sup_category_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> exploreRouter = [
  GoRoute(
    path: ExploreEnum.explore.path,
    name: ExploreEnum.explore.name,
    builder: (BuildContext context, GoRouterState state) {
      return ExploreScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: ExploreEnum.category.path,
        name: ExploreEnum.category.name,
        builder: (BuildContext context, GoRouterState state) {
          return const RecipeCategoryScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: ExploreEnum.supCategory.path,
            name: ExploreEnum.supCategory.name,
            builder: (BuildContext context, GoRouterState state) {
              return const SupCategoryScreen();
            },
          ),
        ],
      )
    ],
  ),
];
