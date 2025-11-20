import 'package:flutter/material.dart';

List<String> images = [
  "images/w4-s2/bird.jpg",
  "images/w4-s2/bird2.jpg",
  "images/w4-s2/insect.jpg",
  "images/w4-s2/girl.jpg",
  "images/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ? Answer: To Hide The Debug Banner
      home: ImageGallery(),
    ));

class ImageGallery extends StatefulWidget {
  const ImageGallery({
    super.key,
  });

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentImage = 0;

  void onNext() {
    setState(() {
      currentImage = (currentImage + 1) % images.length;
    });
  }

  void onPrev() {
    setState(() {
      currentImage = (currentImage - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: onPrev,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: onNext,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentImage]),
    );
  }
}
