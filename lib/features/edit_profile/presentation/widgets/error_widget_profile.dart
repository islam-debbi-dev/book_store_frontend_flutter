import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/profile_cubit.dart';

Widget errorWidgetProfile(String errorMessage, BuildContext context) {
  return Center(
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
          onPressed: () {
            BlocProvider.of<ProfileCubit>(context).getUserProfile();
          },
          child: Text("Retry"),
        ),
      ],
    ),
  );
}
