import 'package:flutter/material.dart';

class customIcomButton extends StatelessWidget {
  final IconData Icons;
  final Function onClick;

  const customIcomButton({Key? key, required this.Icons, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onClick();
      },
      icon: Icon(
        Icons,
        color: Colors.red,
      ),
    );
  }
}
