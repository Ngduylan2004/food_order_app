import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/features/forum/presentation/pages/challenges_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/featured_topic_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/forum_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/group_child_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/group_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> forumRouter = [
  GoRoute(
    path: RouterEnum.forum.path,
    name: RouterEnum.forum.name,
    builder: (BuildContext context, GoRouterState state) {
      return const ForumScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: RouterEnum.topic.path,
        name: RouterEnum.topic.name,
        builder: (BuildContext context, GoRouterState state) {
          return const FeaturedTopicScreen();
        },
      ),
      GoRoute(
        path: RouterEnum.challenge.path,
        name: RouterEnum.challenge.name,
        builder: (BuildContext context, GoRouterState state) {
          return const ChallengesScreen();
        },
      ),
      GoRoute(
        path: RouterEnum.group.path,
        name: RouterEnum.group.name,
        builder: (BuildContext context, GoRouterState state) {
          return const GroupScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouterEnum.groupChild.path,
            name: RouterEnum.groupChild.name,
            builder: (BuildContext context, GoRouterState state) {
              return const GroupChildScreen();
            },
          )
        ],
      )
    ],
  ),
];
