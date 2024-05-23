import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uyishi/1_uyishi.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class ComputationScreen extends StatefulWidget {
  @override
  _ComputationScreenState createState() => _ComputationScreenState();
}

class _ComputationScreenState extends State<ComputationScreen> {
  late Future<int> _result;

  @override
  void initState() {
    super.initState();
    _result = _heavyComputation();
  }

  Future<int> _heavyComputation() async {
    return await Future<int>(() {
      // Simulate a heavy computation
      int sum = 0;
      for (int i = 0; i < 10000000000; i++) {
        sum += i;
      }
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heavy Computation')),
      body: Center(
        child: FutureBuilder<int>(
          future: _result,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Result: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
