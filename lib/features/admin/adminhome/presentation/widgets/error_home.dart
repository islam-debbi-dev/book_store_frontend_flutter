import 'package:booke_store/features/admin/adminhome/logic/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';

Widget errorWidget(String errorMessage, context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error,
            color: Theme.of(context).colorScheme.error, size: 48.sp),
        SizedBox(height: 16),
        Text(
          errorMessage,
          style: TextStyle(
              fontSize: 18.sp, color: Theme.of(context).colorScheme.error),
        ),
        // button
        SizedBox(height: 16.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context)
                  .elevatedButtonTheme
                  .style
                  ?.backgroundColor
                  ?.resolve({})),
          onPressed: () {
            BlocProvider.of<AdminHomeCubit>(context).fetchBooks();
            BlocProvider.of<AdminHomeCubit>(context)
                .fetchAuthors(pageNumberAuthor);
          },
          child: Text(
            "Retry",
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
        ),
      ],
    ),
  );
}
