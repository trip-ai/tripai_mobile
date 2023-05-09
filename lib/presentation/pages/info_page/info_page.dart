import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  static const String routeName = '/info';
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info page'),
      ),
      body: const Center(
        child: Text('Info page'),
      ),
    );
  }
}
