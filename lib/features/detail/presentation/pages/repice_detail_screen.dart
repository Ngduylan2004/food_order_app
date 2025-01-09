import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/detail/presentation/widgets/share_widget/social_share.dart';
import 'package:food_order_app/features/detail/presentation/widgets/tabbar01_widget.dart';
import 'package:food_order_app/features/detail/presentation/widgets/tabbar02_widget.dart';
import 'package:food_order_app/features/detail/presentation/widgets/tabbar03_widget.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  // List<Map<String, dynamic>> media = [
  //   {
  //     'type': 'image',
  //     'url': 'assets/image/food/Chicken.png',
  //   },
  //   {
  //     'type': 'video',
  //     'url': 'assets/image/food/Chicken.png',
  //   },
  //   {
  //     'type': 'image',
  //     'url': 'assets/image/food/Chicken.png',
  //   },
  //   {
  //     'type': 'video',
  //     'url': 'assets/image/food/Chicken.png',
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Để cho phép background của appBar hiển thị
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: 0, right: 20), // Adjust padding as needed
            child: InkWell(
              onTap: () {
                context.pushNamed('image-detail');
              },
              child: Image.asset(
                'assets/image/icons/BackButton.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain, // Adjust fit as needed
              ),
            ),
          ),
        ],
        toolbarHeight: 90,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Hero(
              tag: 'recipe-detail-0',
              child: Container(
                width:
                    double.infinity, // Ensure container fills available width
                height: 330, // Adjust height as needed
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/food/Chicken.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  // Center icon within the container
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/image/icons/Back Button.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Yangnyeom Chicken',
                        style: context.heading6Style
                            ?.copyWith(color: ThemeColor.black)),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => const SocialShare());
                      },
                      child: SvgPicture.asset(
                        'assets/image/icons/Share.svg',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain, // đảm bảo ảnh không bị bóp méo
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          'assets/image/food/Chicken.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover, // Đảm bảo ảnh bao phủ toàn bộ vùng
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Andrew Junn\n',
                                  style: context.bodyLarge500Style),
                              TextSpan(
                                  text: '@andrewjun',
                                  style: context.bodySmall500Style),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: ThemeColor.red),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '27 ${context.tr('recipe_detail_screen.likes')}',
                          style: context.bodyRegular500Style,
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.2,
                ),
                //  sử dụng tại đây
              ]),
            ),
            // tabbar
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: ButtonsTabBar(
                  radius: 30,
                  height: 50, // Chiều cao của các tab
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24), // padding cho tab
                  backgroundColor: ThemeColor.primary,

                  borderColor: ThemeColor.primary,

                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: ThemeColor.lightBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: context.tr('recipe_detail_screen.overview')),
                    Tab(text: context.tr('recipe_detail_screen.ingredients')),
                    Tab(text: context.tr('recipe_detail_screen.directions')),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TabBarView(
                  children: [
                    Tabbar01Widget(),
                    Tabbar02Widget(),
                    Tabbar03Widget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
