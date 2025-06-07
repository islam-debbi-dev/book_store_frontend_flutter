import 'package:booke_store/features/login/data/models/login_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/modern_app_bar.dart';
import 'widgets/profile.dart';
import 'widgets/admin_authors_page.dart';
import 'widgets/admin_books_page.dart';
import '../../../../core/widgets/google_nav_bar_widget.dart';

// Main Admin Homepage Widget
class AdminHomepage extends StatefulWidget {
  final LoginRes arguments;
  const AdminHomepage(this.arguments, {super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  late LoginRes user = widget.arguments;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController
        .dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _selectedIndex != 2
          ? ModernAppBar(
              selectedIndex: _selectedIndex,
              searchController: _searchController,
              username: user.username,
              onNotificationTap: () async {
                // Handle notification tap
                print("Notification tapped");
              },
              onSearchSubmitted: (value) {
                print('Searching for: $value');
                // Handle search logic
              },
            )
          : null,
      body: Stack(
        children: [
          IndexedStack(
            // Use IndexedStack to keep state of pages
            index: _selectedIndex,
            children: [
              AdminBooksPage(),
              AdminAuthorsPage(),
              Profile(adminInfo: user),
            ],
          ),
          Positioned(
            bottom: 10.h,
            left: 0.w,
            right: 0.w,
            child: GoogleNavBarWidget(
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          )
        ],
      ),
      // Add the Bottom Navigation Bar
    );
  }
}
