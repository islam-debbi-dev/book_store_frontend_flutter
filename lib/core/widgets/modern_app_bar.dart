import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/admin/adminhome/logic/admin_home_cubit.dart';

class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final TextEditingController searchController;
  final String? username;
  final VoidCallback? onNotificationTap;
  final Function(String)? onSearchSubmitted;

  const ModernAppBar({
    super.key,
    required this.selectedIndex,
    required this.searchController,
    this.username,
    this.onNotificationTap,
    this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 6,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarHeight: 70,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: selectedIndex == 2 ? null : SearchField(context),
      ),
      actions: [
        if (selectedIndex == 0) FilterButton(context),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget ProfileTitle() {
    return Container(
      width: double.infinity.w,
      key: const ValueKey('profile'),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade400,
            Colors.purple.shade400,
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'Profile ${username ?? ''}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget SearchField(BuildContext context) {
    return Container(
      key: const ValueKey('search'),
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: TextField(
        controller: searchController,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'Search books, authors...',
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.search_rounded,
              color: Colors.grey.shade600,
              size: 22,
            ),
          ),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  onPressed: () {
                    searchController.clear();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20,
          ),
        ),
        onSubmitted: onSearchSubmitted,
      ),
    );
  }

  //filter
  Widget FilterButton(context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: IconButton(
        icon: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () {
          //show filter dialog
          showPriceFilterDialog(context, (min, max) {
            min = 0;
            max = 1000;
            BlocProvider.of<AdminHomeCubit>(context).filterBooks(min, max);
          });
        },
        splashRadius: 24,
        tooltip: 'Filter',
      ),
    );
  }

  void showPriceFilterDialog(
      BuildContext context, void Function(int min, int max) onFilter) {
    final minController = TextEditingController();
    final maxController = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Filter by Price',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
          content: Column(
            children: [
              SizedBox(height: 16),
              CupertinoTextField(
                placeholderStyle: Theme.of(context).textTheme.bodySmall,
                controller: minController,
                placeholder: 'Min Price',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              CupertinoTextField(
                placeholderStyle: Theme.of(context).textTheme.bodySmall,
                controller: maxController,
                placeholder: 'Max Price',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child:
                  Text('Cancel', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child:
                  Text('Filter', style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                final min = int.tryParse(minController.text) ?? 0;
                final max = int.tryParse(maxController.text) ?? 1000;
                onFilter(min, max);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget NotificationButton() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: IconButton(
        icon: Stack(
          children: [
            Icon(
              Icons.notifications_none_rounded,
              color: Colors.grey.shade700,
              size: 24,
            ),
            // Notification badge (optional)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        onPressed: onNotificationTap,
        splashRadius: 24,
        tooltip: 'Notifications',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
