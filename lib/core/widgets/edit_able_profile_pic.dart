import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditableProfilePicture extends StatefulWidget {
  final double size;

  const EditableProfilePicture({super.key, this.size = 120});

  @override
  State<EditableProfilePicture> createState() => _EditableProfilePictureState();
}

class _EditableProfilePictureState extends State<EditableProfilePicture> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: widget.size / 2,
          backgroundColor: Colors.grey[300],
          backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
          child: _imageFile == null
              ? Icon(Icons.person, size: widget.size / 2.2, color: Colors.white)
              : null,
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, size: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
