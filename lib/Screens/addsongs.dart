import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddSongs extends StatefulWidget {
  const AddSongs({super.key});

  @override
  State<AddSongs> createState() => _AddSongsState();
}

class _AddSongsState extends State<AddSongs> {
  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final artistcontroller = TextEditingController();

    const snackBar = SnackBar(
      content: Text('Please Select a File!'),
    );

    String imgURL = '';
    String songURL = '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Songs',
        ),
      ),
      body: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: 'Enter the Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Text(
                'Artist',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              TextFormField(
                controller: artistcontroller,
                decoration: const InputDecoration(
                  hintText: 'Enter the artist',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Text(
                'Pick an Image',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: const Icon(
                    Icons.image,
                  ),
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? imgfile = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (imgfile == null) {
                      return;
                    }

                    String uniqID =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('images');
                    Reference referenceImagetoUpload =
                        referenceDirImages.child(uniqID);
                    try {
                      await referenceImagetoUpload.putFile(File(imgfile.path));
                      imgURL = await referenceImagetoUpload.getDownloadURL();
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
              const Text(
                'Pick a Song',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: const Icon(
                    Icons.music_note,
                  ),
                  onPressed: () async {
                    FilePickerResult? pickedSong =
                        await FilePicker.platform.pickFiles();
                    File? sfile =
                        File(pickedSong!.files.single.path.toString());
                    if (sfile == null) return;
                    String uniqID =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirSongs = referenceRoot.child('songs');
                    Reference referenceSongtoUpload =
                        referenceDirSongs.child(uniqID);
                    try {
                      await referenceSongtoUpload
                          .putFile(File(sfile.path))
                          .then((p0) async {
                        songURL = await referenceSongtoUpload.getDownloadURL();
                      });
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
              Center(
                child: IconButton(
                    onPressed: () {
                      final name = namecontroller.text;
                      final artist = artistcontroller.text;
                      createUser(
                        name: name,
                        artist: artist,
                        imageUrl: imgURL,
                        songsURL: songURL,
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 50,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createUser(
      {required String name,
      required String artist,
      required String imageUrl,
      required String songsURL}) async {
    final docUser = FirebaseFirestore.instance.collection('punjabi').doc(name);
    final json = {
      'name': name,
      'artist': artist,
      'image': imageUrl,
      'song': songsURL,
    };
    await docUser.set(json);
  }
}
