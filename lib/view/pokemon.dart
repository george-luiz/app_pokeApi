import 'package:api_pokemon/components/custom_appbar.dart';
import 'package:api_pokemon/components/tela_erro.dart';
import 'package:api_pokemon/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import '../view-model/api_pokemon.dart';

class Personagem extends StatelessWidget {
  final String nome;

  Personagem({Key? key, required this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customAppbar(
      body: FutureBuilder<PokemonModel>(
          future: apiPokemon(
              parametroUrl: "https://pokeapi.co/api/v2/pokemon/${nome}"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const telaErro();
            } else if (snapshot.hasData) {
              final listaPokemon = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(listaPokemon.sprites.other.home.frontDefault),
                  Center(
                      child: Text(nome,
                          style: const TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold))),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
