import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  static const String routeName = '/info';
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Info page'),
      ),
    );
  }
}
