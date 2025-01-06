import 'package:flutter/material.dart';
import 'package:food_order_app/core/enum/router_enum/dashboard/forum_enum.dart';
import 'package:food_order_app/features/forum/presentation/pages/challenges_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/featured_topic_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/forum_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/group_child_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/group_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> forumRouter = [
  GoRoute(
    path: ForumEnum.forum.path,
    name: ForumEnum.forum.name,
    builder: (BuildContext context, GoRouterState state) {
      return const ForumScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: ForumEnum.topic.path,
        name: ForumEnum.topic.name,
        builder: (BuildContext context, GoRouterState state) {
          return const FeaturedTopicScreen();
        },
      ),
      GoRoute(
        path: ForumEnum.challenge.path,
        name: ForumEnum.challenge.name,
        builder: (BuildContext context, GoRouterState state) {
          return const ChallengesScreen();
        },
      ),
      GoRoute(
        path: ForumEnum.group.path,
        name: ForumEnum.group.name,
        builder: (BuildContext context, GoRouterState state) {
          return const GroupScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: ForumEnum.groupChild.path,
            name: ForumEnum.groupChild.name,
            builder: (BuildContext context, GoRouterState state) {
              return const GroupChildScreen();
            },
          )
        ],
      )
    ],
  ),
];
