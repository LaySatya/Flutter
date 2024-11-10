import 'package:flutter/material.dart';

List<String> images = [
  "assets/W4-S3-Statefull-Widgets/bird.jpg",
  "assets/W4-S3-Statefull-Widgets/bird2.jpg",
  "assets/W4-S3-Statefull-Widgets/insect.jpg",
  "assets/W4-S3-Statefull-Widgets/girl.jpg",
  "assets/W4-S3-Statefull-Widgets/man.jpg",
];

class CarrouselImages extends StatefulWidget {
  const CarrouselImages({super.key});

  @override
  State<CarrouselImages> createState() => _CarrouselImagesState();
}

class _CarrouselImagesState extends State<CarrouselImages> {
  int i = 0;
  // our index start from zero in the list

  void _nextImage(){
    setState(() {
      i = (i + 1) % images.length;
      // get only the remaining value and not bigger than the length of the list
    });
  }

  void _previousImage(){
    setState(() {
      i = (i + (images.length - 1)) % images.length;
      // get the remaining value 
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
              onPressed: () => _previousImage(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: () => _nextImage(),
              ),
            ),
          ],
        ),
        body: Image.asset(images[i]),
      );
  }
}

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      // because this line is to make the debug banner which we usually see it when we are running the app, 
      // so when we set it to false this banner will be hidden
      // and if we set it to true this banner will be shown
      home: CarrouselImages()
    ));
    
