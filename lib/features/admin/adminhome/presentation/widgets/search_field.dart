import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 8.sp,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Search by First Name',
            labelStyle: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            contentPadding:
                EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
