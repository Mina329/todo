import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/strings_manager.dart';
import 'package:todo/core/widgets/custom_icons/custom_icons_icons.dart';
import 'package:todo/features/profile/presentation/view/profile%20view/widgets/custom_list_tile.dart';
import 'package:todo/features/profile/presentation/view/profile%20view/widgets/custom_profile_section_title.dart';

class AppAboutSection extends StatelessWidget {
  AppAboutSection({super.key});
  final List<IconData> icons = [
    CustomIcons.about_icon,
    CustomIcons.info_icon,
    CustomIcons.help_feedback_icon,
    CustomIcons.support_icon,
  ];
  final List<String> names = [
    StringsManager.aboutUs.tr(),
    StringsManager.faq.tr(),
    StringsManager.helpAndFeedback.tr(),
    StringsManager.supportUs.tr(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfileSectionTitle(
          title: StringsManager.appName.tr(),
        ),
        SizedBox(
          height: 5.h,
        ),
        Column(
          children: List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: CustomListTile(
                icon: icons[index],
                name: names[index],
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}