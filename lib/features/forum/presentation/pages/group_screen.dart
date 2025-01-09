import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order_app/core/resources/dimens.dart';
import 'package:food_order_app/core/resources/theme/text/app_text_theme.dart';
import 'package:food_order_app/features/forum/presentation/widgets/groups_widget/all_group_widget.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('forum_screen.join_now'),
              style: context.heading6Style,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/image/icons/setting-4.svg',
              ),
            )
          ],
        ),
        const SizedBox(height: Dimens.marginVertical),
        const AllGroupWidget(),
      ],
    );
  }
}
