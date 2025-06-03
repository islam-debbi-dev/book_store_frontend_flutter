import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feattures/admin/adminhome/data/models/author.dart';

Widget StandardCard(BuildContext context, VoidCallback? onTap, String fullName,
    Author author, bool showNationality,
    [double width = 100, double height = 280]) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(16.r), boxShadow: [
      BoxShadow(
        // user primary color
        color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
        blurRadius: 8.r,
        offset: Offset(0, 2.h),
      )
    ]),
    width: width.w,
    height: height.h,
    child: Card(
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
            children: [
              // Avatar Section
              Expanded(flex: 4, child: Avatar(size: 100.sp, context: context)),
              SizedBox(height: 10.h),
              // Name Section
              Expanded(
                flex: 1,
                child: Text(
                  fullName.isNotEmpty ? fullName : 'Unknown Author',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(height: 8.h),

              // Nationality
              if (showNationality && author.nationality != null)
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h,
                    ),

                    // Theme.of(context).colorScheme.secondary
                    // Theme.of(context).colorScheme.primary

                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.7),
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.public,
                          size: 16.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            author.nationality!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
    bool hasBorder = true,
    required BuildContext context}) {
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
      ));
}

Widget InfoRow(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

String _formatDate(String dateString) {
  try {
    final date = DateTime.parse(dateString);
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  } catch (e) {
    return 'Unknown';
  }
}
