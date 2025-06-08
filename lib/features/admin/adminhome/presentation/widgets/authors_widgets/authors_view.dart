import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../search_field.dart';
import '../../../../../../core/helpers/constants.dart';
import '../../../data/models/author.dart';
import '../../../logic/admin_home_cubit.dart';
import '../../../../../../core/widgets/author_card.dart';
import '../../../../../../core/router/constants_router.dart';

class AuthorsView extends StatefulWidget {
  const AuthorsView({super.key, required this.authors});
  final List<Author> authors;
  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<AuthorsView> {
  final scrollController = ScrollController();
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();

  void _onScroll() {
    if (_isBottom) {
      pageNumberAuthor += 1;
      context.read<AdminHomeCubit>().fetchAuthors(pageNumberAuthor);
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  List<Author> get _filteredAuthors {
    if (_searchText.isEmpty) return widget.authors;
    return widget.authors
        .where((author) => (author.firstName ?? '')
            .toLowerCase()
            .contains(_searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Field
          SearchField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
            ),
            itemCount: _filteredAuthors.length,
            itemBuilder: (context, index) {
              return AuthorCard(
                author: _filteredAuthors[index],
                cardStyle: CardStyle.standard,
                onTap: () => Navigator.pushNamed(context, detailsScreen,
                    arguments: _filteredAuthors[index]),
              );
            },
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
