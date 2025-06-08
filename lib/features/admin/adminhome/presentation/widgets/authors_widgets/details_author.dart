import 'package:flutter/material.dart';
import '../../../data/models/author.dart';

class DetailsAuthor extends StatelessWidget {
  final Author author;

  const DetailsAuthor({super.key, required this.author});

  Widget biuldSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600, // height of the picteur
      pinned: true, // to make it always on top
      stretch: true, // to make it strech when scrolling
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, // to make the title in the center
        title: Text(
          author.firstName.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        background: Hero(
          tag: author.id.toString(),
          child: Image.asset(
            'assets/images/book.jpg',
            fit: BoxFit.cover, // to make it cover the whole space
          ),
        ),
      ),
    );
  }

  Widget authorInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow
          .ellipsis, // to make pionts in the end if text is too long and i'm not interested in the rest of the text

      text: TextSpan(
        text: '$title: ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      indent: endIndent,
      endIndent: endIndent / 2,
      color: const Color.fromARGB(255, 75, 73, 73),
      thickness: 2, // thickness of the line
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 73, 73),
      body: CustomScrollView(
        slivers: [
          biuldSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  authorInfo('Status', author.lastName.toString()),
                  buildDivider(100),
                  SizedBox(height: 10),
                  authorInfo('Species', author.nationality.toString()),
                  buildDivider(100),
                  authorInfo('Gender', 'Gender'),
                  buildDivider(100),
                  SizedBox(height: 10),
                  authorInfo('Origin', 'Origin'),
                  buildDivider(100),
                  SizedBox(height: 10),
                  authorInfo('Location', 'Location'),
                  buildDivider(100),
                  SizedBox(height: 10),
                  authorInfo('Created', author.createdAt.toString()),
                  buildDivider(100),
                  SizedBox(height: 300),
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}
