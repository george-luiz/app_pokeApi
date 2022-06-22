import 'package:api_pokemon/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import '../view-model/api_pokemon.dart';

class Personagem extends StatelessWidget {
  final String nome;
  Personagem({Key? key, required this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Poke App"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: FutureBuilder<PokemonModel>(
            future: apiPokemon(
                parametroUrl: "https://pokeapi.co/api/v2/pokemon/${nome}"),
            builder: (context, snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
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
            }));
  }
}
