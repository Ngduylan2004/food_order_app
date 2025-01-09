import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/home/presentation/widgets/image_stack_widget.dart';
import 'package:food_order_app/features/home/presentation/widgets/list_product_widget.dart';
import 'package:food_order_app/features/home/presentation/widgets/slider_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        toolbarHeight: 140,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColor.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimens.paddingVerticalDashboardTop),
              child: Text(
                context.tr('home_screen.title'),
                style: context.heading4Style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimens.paddingVerticalDashboardTop),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingHorizontalDashboard,
              vertical: Dimens.paddingVerticalDashboard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Ảnh nền
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Bo tròn ảnh
                    child: SizedBox(
                      width: double.infinity,
                      height: 194,
                      child: Image.asset(
                        'assets/image/food/banner_home.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient mờ lên ảnh với bo tròn
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Bo tròn gradient
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(0.9),
                            ],
                            stops: const [0.0, 0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Nội dung khác (văn bản và icon)
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chicken Curry',
                          style: context.heading5Style?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'This Italian pasta and steak will\nwarm up the faintest of hearts.',
                          style: context.bodyLarge500Style?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        'assets/image/icons/play_video.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: Dimens.marginVerticalMedium),
              Row(
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     context.read<LanguageBloc>().add(LanguageEvent());
                  //   },
                  //   child: const Icon(Icons.language),
                  // ),
                  InkWell(
                      onTap: () {
                        context.goNamed('login');
                      },
                      child: Text('quay về đăng nhập',
                          style: context.bodySmall500Style)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.tr('home_screen.recent_recipes_title'),
                      style: context.heading5Style),
                  Text(
                      context.tr(
                        'home_screen.view_all_title',
                      ),
                      style: context.bodyLarge500Style
                          ?.copyWith(color: ThemeColor.primary)),
                ],
              ),
              const SizedBox(height: Dimens.marginVerticalSmall),
              const SliderWidget(),
              const SizedBox(height: Dimens.marginVerticalMedium),
              // Image Stack Widget
              const ImageStackWidget(),
              const SizedBox(height: Dimens.marginVerticalMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.tr('home_screen.recommended_title'),
                      style: context.heading5Style),
                  Text(context.tr('home_screen.view_all_title'),
                      style: context.bodyLarge500Style
                          ?.copyWith(color: ThemeColor.primary)),
                ],
              ),
              const SizedBox(height: Dimens.marginVerticalSmall),
              const ListProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
