import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/strings_manager.dart';
import 'package:todo/core/widgets/custom_icons/custom_icons_icons.dart';

class ApplicationItem extends StatelessWidget {
  const ApplicationItem(
      {super.key, required this.appName, required this.hours});
  final String appName;
  final String hours;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withOpacity(0.21)
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '${StringsManager.youSpent}$hours${StringsManager.on}$appName ${StringsManager.today}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              VerticalDivider(
                thickness: 3,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.grey[700],
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                CustomIcons.info_icon,
                size: 30.sp,
                color: Theme.of(context).brightness == Brightness.dark
                    ? null
                    : Colors.grey[700],
              )
            ],
          ),
        ],
      ),
    );
  }
}