import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'OR',
            style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8)),
          ),
        ),
        Expanded(
            child: Divider(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7))),
      ],
    );
  }
}