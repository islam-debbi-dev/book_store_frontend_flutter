import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/profile_cubit.dart';

Widget errorWidgetProfile(String errorMessage, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // button back
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
            color: Theme.of(context).iconTheme.color,
          )),
      SizedBox(height: MediaQuery.of(context).size.height * 0.30.h),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error,
                color: Theme.of(context).colorScheme.error, size: 48.sp),
            SizedBox(height: 16.h),
            Text(
              errorMessage,
              style: TextStyle(
                  fontSize: 18.sp, color: Theme.of(context).colorScheme.error),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context)
                      .elevatedButtonTheme
                      .style
                      ?.backgroundColor
                      ?.resolve({})),
              onPressed: () {
                BlocProvider.of<ProfileCubit>(context).getUserProfile();
              },
              child: Text(
                "Retry",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
