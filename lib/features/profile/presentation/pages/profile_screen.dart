import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_app/core/component/button/app_ouline_button.dart';
import 'package:food_order_app/core/component/button/app_solid_button.dart';
import 'package:food_order_app/core/component/textFiled/auth_text_filed.dart';
import 'package:food_order_app/core/theme/colors/theme_color.dart';
import 'package:food_order_app/core/theme/text/app_text_theme.dart';
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
      create: (context) => ProfileBloc()..add(ProfileEvent()),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  'Profile',
                  style: context.heading4Style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: SvgPicture.asset(
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                                text: 'Edit Profile',
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Recipes', style: context.heading5Style),
                    Text(
                      'View all',
                      style: context.bodyRegular500Style?.copyWith(
                        color: ThemeColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const MyRecipesWidget(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Saved Recipes', style: context.heading5Style),
                    Text(
                      'View all',
                      style: context.bodyRegular500Style?.copyWith(
                        color: ThemeColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const SaveRecipesWidget(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Saved Challenges', style: context.heading5Style),
                    Text(
                      'View all',
                      style: context.bodyRegular500Style?.copyWith(
                        color: ThemeColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Text(
                    'Edit Profile',
                    style: context.heading5Style,
                  ),
                  const SizedBox(height: 20),
                  // Trường Full Name
                  AuthTextFiled(
                      controller: fullNameController,
                      label: 'Full Name',
                      prefixIcon: Icons.person,
                      obscureText: false,
                      onTap: () {},
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(height: 18),
                  // Trường Email
                  AuthTextFiled(
                      controller: emailController,
                      label: 'Email',
                      prefixIcon: Icons.email,
                      obscureText: false,
                      onTap: () {},
                      validator: (value) {
                        return null;
                      }),
                  const SizedBox(height: 20),
                  // Nút Lưu
                  AppSolidButton(
                    onPressed: () {},
                    text: 'Save',
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
