import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<UserImagePicker> {
  @override
  void Pickimage() {
    ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: Pickimage,
          icon: Icon(Icons.image),
          label: Text(
            'Add Image',
          ),
        )
      ],
    );
  }
}
