import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_uploading_file/controllers/upload_file.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final imagePicker = ImagePicker();
  var _image;

  @override
  Widget build(BuildContext context) {
    void addImage() async {
      XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 50,
          preferredCameraDevice: CameraDevice.front);
      setState(() {
        _image = File(image!.path);
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => addImage(),
        label: const Text("Add Image"),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Upload image to server"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 350.0,
                        height: 350.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        width: 350,
                        height: 350,
                        child: Icon(
                          Icons.camera_alt,
                          size: 80,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              _image != null
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 75),
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        UploadFile uf = UploadFile();

                        var result = uf.uploadFile(_image);
                      },
                      child: const Text('Upload Image to server'),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
