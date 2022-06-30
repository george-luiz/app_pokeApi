import 'package:flutter/material.dart';

class customAppbar extends StatelessWidget {
  final Widget body;
  const customAppbar({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poke App"),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
