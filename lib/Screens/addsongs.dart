import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:spotify_clone/Widgets/image_picker.dart';

class AddSongs extends StatefulWidget {
  const AddSongs({super.key});

  @override
  State<AddSongs> createState() => _AddSongsState();
}

class _AddSongsState extends State<AddSongs> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final ImagePicker picker = ImagePicker();
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Text(
                'Artist',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the artist',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              UserImagePicker(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
