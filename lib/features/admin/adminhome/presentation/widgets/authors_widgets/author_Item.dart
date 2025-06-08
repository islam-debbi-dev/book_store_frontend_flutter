import 'package:flutter/material.dart';
import '../../../data/models/author.dart';
import '../../../../../../core/router/constants_router.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.author});

  final Author author;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, detailsScreen, arguments: author);
        },
        child: GridTile(
            footer: Hero(
              tag: author.id.toString(),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Theme.of(context).dialogBackgroundColor,
                alignment: Alignment.bottomCenter,
                child: Text(
                  author.firstName.toString(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // make pionts in the end if text is too long
                  maxLines: 2, // max lines to show
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Container(
                color: Colors.grey,
                child: // author.image.toString().isNotEmpty
                    // ? FadeInImage(
                    //     width: double.infinity,
                    //     height: double.infinity,
                    //     placeholder:
                    //         AssetImage('assets/images/icon_loading.gif'),
                    //     image: NetworkImage(author.image.toString()),
                    //     fit: BoxFit.cover,
                    //   )
                    // :
                    Image.asset('assets/images/book.jpg'))),
      ),
    );
  }
}
