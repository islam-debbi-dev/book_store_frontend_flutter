import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feattures/admin/adminhome/data/models/author.dart';

Widget CompactCard(
  BuildContext context,
  VoidCallback? onTap,
  String fullName,
  Author author,
  bool showNationality, {
  double width = 260,
  double height = 100,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Row(
            children: [
              Avatar(size: 50.sp, context: context),
              SizedBox(width: 10.w),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fullName.isNotEmpty ? fullName : 'Unknown Author',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (showNationality && author.nationality != null)
                      SizedBox(height: 4.h),
                    if (showNationality && author.nationality != null)
                      Text(
                        author.nationality!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Avatar({required double size, required BuildContext context, bool hasBorder = true}) {
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