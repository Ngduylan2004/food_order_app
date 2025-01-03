import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/core/navigator/bottom_navigator.dart'; // Import BottomNavigator
import 'package:food_order_app/core/navigator/router/detail_router.dart';
import 'package:food_order_app/core/navigator/router/explore_router.dart';
import 'package:food_order_app/core/navigator/router/forum_router.dart';
import 'package:food_order_app/core/navigator/router/grocery_router.dart';
import 'package:food_order_app/core/navigator/router/home_router.dart';
import 'package:food_order_app/core/navigator/router/profile_router.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> dashboardRouter = [
  GoRoute(
    path: RouterEnum.dashboard.path,
    name: RouterEnum.dashboard.name,
    builder: (context, state) =>
        const BottomNavigator(), // BottomNavigator sẽ được hiển thị ở đây
    routes: <RouteBase>[
      ...homeRouter,
      ...groceryRouter,
      ...exploreRouter,
      ...forumRouter,
      ...profileRouter,
      ...detailRouter,
    ],
  ),
];
