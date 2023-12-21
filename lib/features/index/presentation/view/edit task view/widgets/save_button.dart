import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/utils/strings_manager.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              StringsManager.save,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 35.h,
        )
      ],
    );
  }
}
