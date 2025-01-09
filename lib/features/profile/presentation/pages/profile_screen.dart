import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/component/textFiled/auth_text_filed.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/colors/theme_color.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:food_order_app/features/profile/presentation/widgets/my_recipes_widget.dart';
import 'package:food_order_app/features/profile/presentation/widgets/save_chanllenges_widget.dart';
import 'package:food_order_app/features/profile/presentation/widgets/save_recipes_widget.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ProfileBloc()..add(ProfileEvent()),
      child: Scaffold(
        backgroundColor: ThemeColor.white,
        appBar: AppBar(
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
                  context.tr('profile_screen.title'),
                  style: context.heading4Style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: Dimens.paddingVerticalDashboardTop),
                child:
                    //  PopupMenuButton(

                    //   itemBuilder: (context) {
                    //     return [
                    //       const PopupMenuItem<String>(
                    //           value: 'Option 1', child: Text('Option 1')),
                    //       const PopupMenuItem<String>(
                    //           value: 'Option 2', child: Text('Option 2')),
                    //       const PopupMenuItem<String>(
                    //           value: 'Option 3', child: Text('Option 3')),
                    //     ];
                    //   },
                    // )
                    SvgPicture.asset(
                  'assets/image/icons/solar_settings-linear.svg',
                  width: 32,
                  height: 32,
                ),
              ),
            ],
          ),
          toolbarHeight: 140,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.paddingHorizontalDashboard,
                vertical: Dimens.paddingVerticalDashboard),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/image/food/Chicken.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user?.displayName == null
                                    ? state.fullName
                                    : state.user?.displayName ?? '',
                                style: context.heading6Style?.copyWith(
                                  color: ThemeColor.black,
                                ),
                              ),
                              Text(
                                state.user?.email ?? '',
                                style: context.bodyRegular500Style
                                    ?.copyWith(color: ThemeColor.lightBlack),
                              ),
                              const SizedBox(height: 10),
                              AppOulineButton(
                                text: context.tr('profile_screen.edit_profile'),
                                onPressed: () {
                                  _showEditProfileDialog(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: Dimens.marginVerticalMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.tr('profile_screen.my_recipes'),
                        style: context.heading5Style),
                    Text(
                      context.tr('profile_screen.view_all'),
                      style: context.bodyRegular500Style?.copyWith(
                        color: ThemeColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimens.marginVerticalMedium),
                const MyRecipesWidget(),
                const SizedBox(height: Dimens.marginVerticalMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.tr('profile_screen.saved_recipes'),
                        style: context.heading5Style),
                    Text(
                      context.tr('profile_screen.view_all'),
                      style: context.bodyRegular500Style?.copyWith(
                        color: ThemeColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimens.marginVerticalMedium),
                const SaveRecipesWidget(),
                const SizedBox(height: Dimens.marginVerticalMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.tr('profile_screen.saved_challenges'),
                        style: context.heading5Style),
                    Text(
                      context.tr('profile_screen.view_all'),
                      style: context.bodyRegular500Style?.copyWith(
                        color: ThemeColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimens.marginVerticalMedium),
                const SaveChanllengesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm hiển thị Dialog chỉnh sửa thông tin
  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: ThemeColor.white,
          child: SizedBox(
            width: 400,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingHorizontalDashboard,
                  vertical: Dimens.paddingVerticalDashboard),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Text(
                    context.tr('profile_screen.edit_profile'),
                    style: context.heading5Style,
                  ),
                  const SizedBox(height: Dimens.marginVerticalMedium),
                  // Trường Full Name
                  AuthTextFiled(
                      controller: fullNameController,
                      label: context.tr('profile_screen.name'),
                      prefixIcon: Icons.person,
                      obscureText: false,
                      onTap: () {},
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(height: Dimens.marginVerticalMedium),
                  // Trường Email
                  AuthTextFiled(
                      controller: emailController,
                      label: context.tr('profile_screen.email'),
                      prefixIcon: Icons.email,
                      obscureText: false,
                      onTap: () {},
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(height: Dimens.marginVerticalMedium),
                  // Nút Lưu
                  AppSolidButton(
                    onPressed: () {},
                    text: context.tr('profile_screen.save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
