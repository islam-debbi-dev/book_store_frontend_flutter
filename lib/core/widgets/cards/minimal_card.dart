import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/admin/adminhome/data/models/author.dart';

Widget MinimalCard(
  BuildContext context,
  VoidCallback? onTap,
  String fullName,
  Author author,
  bool showNationality, {
  double width = 120,
  double height = 120,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Avatar(size: 40.sp, context: context),
              SizedBox(height: 8.h),
              Text(
                fullName.isNotEmpty ? fullName : 'Unknown',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showNationality && author.nationality != null)
                Text(
                  author.nationality!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Avatar(
    {required double size,
    required BuildContext context,
    bool hasBorder = true}) {
  return Container(
    width: size,
    height: size,
    decoration: hasBorder
        ? BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          )
        : null,
    child: CircleAvatar(
      radius: size / 2,
      backgroundImage: const AssetImage('assets/images/author.jpg'),
      backgroundColor: Colors.transparent,
    ),
  );
}
