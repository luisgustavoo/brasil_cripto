import 'package:flutter/material.dart';

class CoinsDetailsScreen extends StatelessWidget {
  const CoinsDetailsScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$id'),
      ),
      body: Container(),
    );
  }
}
