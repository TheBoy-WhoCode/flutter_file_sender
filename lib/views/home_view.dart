import 'package:flutter/material.dart';
import 'package:flutter_uploading_file/utils/image_from_gallery_state.dart';

enum ImageSourceType { gallery, camera }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload image to server"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                _handleURLButtonPress(context, ImageSourceType.gallery);
              },
              child: const Text(
                "Pick image from gallery",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _handleURLButtonPress(context, ImageSourceType.camera);
              },
              child: const Text(
                "Pick image from Camera",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
