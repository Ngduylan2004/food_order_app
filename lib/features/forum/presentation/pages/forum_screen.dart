import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/forum/presentation/pages/challenges_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/featured_topic_screen.dart';
import 'package:food_order_app/features/forum/presentation/pages/group_screen.dart';
import 'package:food_order_app/features/forum/presentation/widgets/tabbar_widget.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  int index = 1;
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
                  context.tr('forum_screen.title'),
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F6F5),
                    borderRadius: BorderRadius.circular(46),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        TabbarWidget(
                          isActive: index == 1,
                          ontap: () {
                            _onIndex(1);
                          },
                          text: context.tr('forum_screen.featured_topics'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TabbarWidget(
                          isActive: index == 2,
                          ontap: () {
                            _onIndex(2);
                          },
                          text: context.tr('forum_screen.challenges'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TabbarWidget(
                          isActive: index == 3,
                          ontap: () {
                            _onIndex(3);
                          },
                          text: context.tr('forum_screen.groups'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimens.marginVerticalMedium,
                ),
                _build(index),
              ],
            ),
          ),
        ));
  }

  Widget _build(int step) {
    switch (step) {
      case 1:
        return const FeaturedTopicScreen();
      case 2:
        return const ChallengesScreen();
      case 3:
        return const GroupScreen();
      default:
        return Center(
          child: Text(
            'Page not found',
            style: context.bodyRegular500Style,
          ),
        );
    }
  }

  void _onIndex(int step) {
    setState(() {
      index = step;
    });
  }
}
