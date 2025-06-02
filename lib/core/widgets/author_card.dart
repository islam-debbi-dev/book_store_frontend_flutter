import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feattures/admin/adminhome/data/models/author.dart';

// Modern Author Card Widget
class AuthorCard extends StatefulWidget {
  final Author author;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool showNationality;
  final bool showCreatedDate;
  final CardStyle cardStyle;

  const AuthorCard({
    Key? key,
    required this.author,
    this.onTap,
    this.width,
    this.height,
    this.showNationality = true,
    this.showCreatedDate = false,
    this.cardStyle = CardStyle.standard,
  }) : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  // Helper methods
  String get fullName {
    final first = widget.author.firstName ?? '';
    final last = widget.author.lastName ?? '';
    return '$first $last'.trim();
  }

  String get initials {
    final first = widget.author.firstName?.isNotEmpty == true
        ? widget.author.firstName![0]
        : '';
    final last = widget.author.lastName?.isNotEmpty == true
        ? widget.author.lastName![0]
        : '';
    return '$first$last'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.cardStyle) {
      case CardStyle.compact:
        return CompactCard(context);
      case CardStyle.detailed:
        return DetailedCard(context);
      case CardStyle.minimal:
        return MinimalCard(context);
      default:
        return StandardCard(context);
    }
  }

  Widget StandardCard(BuildContext context) {
    return Container(
      width: widget.width != null ? widget.width!.w : null,
      height: widget.height != null ? widget.height!.h : 280.h,
      child: Card(
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(5.0.w),
            child: Column(
              children: [
                // Avatar Section
                Expanded(flex: 4, child: Avatar(size: 80.w)),
                SizedBox(height: 10.h),
                // Name Section
                Expanded(
                  flex: 1,
                  child: Text(
                    fullName.isNotEmpty ? fullName : 'Unknown Author',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: 8.h),

                // Nationality
                if (widget.showNationality && widget.author.nationality != null)
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Colors.blue[200]!,
                          width: 1.w,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.public,
                            size: 16.sp,
                            color: Colors.blue[700],
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              widget.author.nationality!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[700],
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

  Widget CompactCard(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 100,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Avatar(size: 50),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        fullName.isNotEmpty ? fullName : 'Unknown Author',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.showNationality &&
                          widget.author.nationality != null)
                        const SizedBox(height: 4),
                      if (widget.showNationality &&
                          widget.author.nationality != null)
                        Text(
                          widget.author.nationality!,
                          style: TextStyle(
                            fontSize: 14,
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
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget DetailedCard(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 320,
      child: Card(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              // Header with gradient
              Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue[400]!,
                      Colors.blue[600]!,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),

              // Avatar overlapping header
              Transform.translate(
                offset: const Offset(0, -40),
                child: Avatar(size: 80, hasBorder: true),
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),

                      Text(
                        fullName.isNotEmpty ? fullName : 'Unknown Author',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 12),

                      if (widget.showNationality &&
                          widget.author.nationality != null)
                        InfoRow(
                          Icons.public,
                          'Nationality',
                          widget.author.nationality!,
                        ),

                      if (widget.showCreatedDate &&
                          widget.author.createdAt != null)
                        InfoRow(
                          Icons.calendar_today,
                          'Member since',
                          _formatDate(widget.author.createdAt!),
                        ),

                      const Spacer(),

                      // Action button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: widget.onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'View Profile',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
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
    );
  }

  Widget MinimalCard(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 120,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Avatar(size: 40),
                const SizedBox(height: 8),
                Text(
                  fullName.isNotEmpty ? fullName : 'Unknown',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.showNationality && widget.author.nationality != null)
                  Text(
                    widget.author.nationality!,
                    style: TextStyle(
                      fontSize: 12,
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

  Widget Avatar({required double size, bool hasBorder = true}) {
    return Container(
        width: size,
        height: size,
        decoration: hasBorder
            ? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
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
}

enum CardStyle {
  standard,
  compact,
  detailed,
  minimal,
}
