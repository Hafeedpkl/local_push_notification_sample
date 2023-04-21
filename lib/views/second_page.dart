import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key, required this.payload});
  String payload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(payload),
      ),
    );
  }
}
