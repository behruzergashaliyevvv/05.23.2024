import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 100,
        itemBuilder: (context, index) {
          return _buildImage();
        },
      ),
    );
  }

  Widget _buildImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/images/load.gif'), // Placeholder rasm
      image: AssetImage("assets/images/Jesko.jpg"),
      fit: BoxFit.cover,
    );
  }
}
