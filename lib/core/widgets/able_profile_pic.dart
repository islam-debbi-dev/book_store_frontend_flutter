import 'package:flutter/material.dart';

class AbleProfilePicture extends StatefulWidget {
  final double size;

  const AbleProfilePicture({super.key, this.size = 120});

  @override
  State<AbleProfilePicture> createState() => _AbleProfilePictureState();
}

class _AbleProfilePictureState extends State<AbleProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: widget.size / 2,
        backgroundColor: Colors.grey[300],
        child:
            Icon(Icons.person, size: widget.size / 2.2, color: Colors.white));
  }
}
