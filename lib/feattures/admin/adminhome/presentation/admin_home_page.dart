import 'package:booke_store/feattures/login/data/models/login_res.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'widgets/admin_authors_page.dart';
import 'widgets/admin_books_page.dart';
import 'widgets/admin_profile_page.dart';

// Main Admin Homepage Widget
class AdminHomepage extends StatefulWidget {
  final LoginRes arguments;
  const AdminHomepage(this.arguments, {super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;
  final TextEditingController _searchController = TextEditingController();
  late LoginRes user = widget.arguments;

  @override
  void initState() {
    super.initState();
    _pages = [
      AdminBooksPage(),
      const AdminAuthorsPage(),
      AdminProfilePage(adminInfo: widget.arguments),
    ];
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        elevation: 1, // Subtle shadow
        title: Container(
          height: 40, // Constrain height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: _selectedIndex == 2
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Profile ${user.username ?? ''}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                      letterSpacing: 0.3,
                    ),
                  ))
              : TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search books, authors...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    border: InputBorder.none, // Remove default border
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0), // Adjust padding
                  ),
                  onSubmitted: (value) {
                    // Handle search submission logic here
                    print('Searching for: $value');
                    // You might want to navigate to a search results page
                    // or filter the current view based on the search term.
                  },
                ),
        ),
        // Optional: Add actions like notifications or settings
        actions: [
          _selectedIndex == 2
              ? SizedBox()
              : IconButton(
                  icon: Icon(Icons.notifications_none, color: Colors.grey[800]),
                  onPressed: () async {
                    // Handle notifications action
                    final userToken = await SharedPrefHelper.getString(
                        SharedPrefKeys.userToken);
                    print(userToken);
                  },
                ),
        ],
      ),
      // Display the currently selected page from the list
      body: IndexedStack(
        // Use IndexedStack to keep state of pages
        index: _selectedIndex,
        children: [
          AdminBooksPage(),
          const AdminAuthorsPage(),
          AdminProfilePage(adminInfo: widget.arguments),
        ],
      ),
      // Add the Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Authors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 5,
      ),
    );
  }
}
