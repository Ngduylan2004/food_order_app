import 'package:food_order_app/core/enum/router_enum/router_enum.dart';
import 'package:food_order_app/features/detail/presentation/pages/image_detail.screen.dart';
import 'package:food_order_app/features/detail/presentation/pages/repice_detail_screen.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> detailRouter = [
  GoRoute(
    path: RouterEnum.detail.path,
    name: RouterEnum.detail.name,
    builder: (context, state) {
      return const RecipeDetailScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: RouterEnum.imageDetail.path,
        name: RouterEnum.imageDetail.name,
        builder: (context, state) {
          return const ImageDetailScreen();
        },
      ),
    ],
  ),
];
