import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageScreen(),
    );
  }
}

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Loading')),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: 100,
        itemBuilder: (context, index) {
          return _buildImage();
        },
      ),
    );
  }

  Widget _buildImage() {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)), // Delay 2 seconds
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Image.asset('assets/images/load.gif'); // Show loading gif
        } else {
          return Image.asset('assets/images/Jesko.jpg'); // Show Jesko.jpg
        }
      },
    );
  }
}
