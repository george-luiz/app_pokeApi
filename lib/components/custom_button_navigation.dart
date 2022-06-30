import 'package:flutter/material.dart';

class customButtomNavigation extends StatelessWidget {
  final String nome;
  final Function onClick;

  const customButtomNavigation({Key? key, required this.nome, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 2.0),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 0.6),
                bottom:
                BorderSide(width: 0.6)),
          ),
          child: ListTile(
            title: Text(nome),
            trailing: const Icon(
                Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

