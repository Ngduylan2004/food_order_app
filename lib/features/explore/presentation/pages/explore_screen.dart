import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/explore/presentation/widgets/list_category_widget.dart';

class ExploreScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 140,
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColor.white,
        title: Padding(
          padding:
              const EdgeInsets.only(top: Dimens.paddingVerticalDashboardTop),
          child: Text(context.tr('explore_screen.title'),
              style: context.heading4Style),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingHorizontalDashboard,
              vertical: Dimens.paddingVerticalDashboard),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, //căn đều các phần tử
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: const Color(0xfff5f6f5),
                  filled: true, //để đặt màu nền
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18), //khoảng cách giữa nội dung và viền
                  hintText: context.tr('explore_screen.search_hint'),
                  hintStyle: context.bodyRegular500Style?.copyWith(
                    color: ThemeColor.lightBlack,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(200),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/image/icons/akar-icons_search.svg',
                      colorFilter: const ColorFilter.mode(
                        ThemeColor.lightBlack,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/image/icons/setting-4.svg',
                    ),
                  ),
                ),
                style: context.bodyLarge500Style?.copyWith(
                  color: ThemeColor.lightBlack,
                ),
                enableInteractiveSelection: true,
              ),
              const SizedBox(height: Dimens.marginVerticalMedium),
              Text(context.tr('explore_screen.category_title'),
                  style: context.heading5Style),
              const SizedBox(height: Dimens.marginVerticalMedium),
              const ListCategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
