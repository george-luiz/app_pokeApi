import 'package:flutter/material.dart';

class telaErro extends StatelessWidget {
  final String? namePerson;

  const telaErro({Key? key, this.namePerson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(namePerson == null ? "Não há conexão com a internet" : "Não encontrado pokemon ${namePerson}"),
        ],
      ),
    );
  }
}
