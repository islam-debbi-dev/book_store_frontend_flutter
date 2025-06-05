import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditableProfilePicture extends StatefulWidget {
  final double size;

  const EditableProfilePicture(int i, {super.key, this.size = 120});

  @override
  State<EditableProfilePicture> createState() => _EditableProfilePictureState();
}

class _EditableProfilePictureState extends State<EditableProfilePicture> {
  File? _imageFile;
  bool _isPicking = false; // Add this flag

  Future<void> _pickImage() async {
    if (_isPicking) return; // Prevent multiple pickers
    setState(() {
      _isPicking = true;
    });
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } finally {
      setState(() {
        _isPicking = false;
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
          bottom: 0.h,
          right: 4.w,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              padding: EdgeInsets.all(6.sp),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, size: 20.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
