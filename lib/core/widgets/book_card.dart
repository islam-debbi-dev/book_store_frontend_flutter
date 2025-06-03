import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../feattures/admin/adminhome/data/models/book.dart';

class BookCard extends StatelessWidget {
  final Book data;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const BookCard({
    super.key,
    required this.data,
    this.onTap,
    this.width,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover Image Section
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    color: Colors.grey[200],
                  ),
                  child: data.cover != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/book.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Placeholder(),
                ),
              ),
              SizedBox(height: 8.h),
              // Content Section
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 9.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      if (data.title != null)
                        Text(
                          data.title!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                      SizedBox(height: 16.h),

                      // Author Section
                      if (data.author != null)
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12.r,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: data.author!.image != null
                                  ? NetworkImage(data.author!.image!)
                                  : const AssetImage(
                                      'assets/images/author.jpg'),
                              child: data.author!.image == null
                                  ? Text(
                                      data.author!.firstName?.isNotEmpty == true
                                          ? data.author!.firstName![0]
                                              .toUpperCase()
                                          : 'A',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : null,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                data.author!.firstName.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),

              // Price Section
              if (data.price != null)
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 233, 234),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 212, 219, 225)
                                  .withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.attach_money,
                              color:
                                  data.price! < 20 ? Colors.green : Colors.red,
                              size: 18.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              data.price!.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: data.price! < 20
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Placeholder() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[300]!,
            Colors.grey[200]!,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Icon(
        Icons.image_outlined,
        size: 48.sp,
        color: Colors.grey[400],
      ),
    );
  }
}
