import 'package:api_pokemon/model/home_model.dart';
import 'package:api_pokemon/model/pokemon_model.dart';
import 'package:api_pokemon/view-model/api_home.dart';
import 'package:api_pokemon/view-model/api_pokemon.dart';
import 'package:api_pokemon/view/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/tela_erro.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10";
  final TextEditingController nomePersonagem = TextEditingController();
  String namePerson = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Poke App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: const InputDecoration(hintText: "Procurar pelo pokemon"),
                minLines: 1,
                controller: nomePersonagem,
                keyboardType: TextInputType.text,
                onEditingComplete: () {
                  namePerson = nomePersonagem.text;
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: nomePersonagem.text.isEmpty
                  ? FutureBuilder<HomeModel>(
                      future: apiHome(parametroUrl: url),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const telaErro();
                        } else if (snapshot.hasData) {
                          final listaHome = snapshot.data!;

                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: listaHome.results.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Personagem(
                                                              nome: listaHome
                                                                  .results[
                                                                      index]
                                                                  .name)),
                                                );
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide(
                                                          width: 0.6),
                                                      bottom: BorderSide(
                                                          width: 0.6)),
                                                ),
                                                child: ListTile(
                                                  title: Text(listaHome
                                                      .results[index].name),
                                                  trailing: const Icon(
                                                      Icons.arrow_forward_ios),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          url = listaHome.previous != Null
                                              ? "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10"
                                              : listaHome.previous;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.red,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          url = listaHome.next;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
                  : FutureBuilder<PokemonModel>(
                      future: apiPokemon(
                          parametroUrl:
                              "https://pokeapi.co/api/v2/pokemon/${namePerson}?offset=0&limit=10"),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return telaErro(namePerson: namePerson,);
                        }
                        else if (snapshot.hasData) {
                          final listaHome = snapshot.data!;

                          return Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Personagem(
                                                        nome: listaHome.name)),
                                          );
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(width: 0.6),
                                                bottom: BorderSide(width: 0.6)),
                                          ),
                                          child: ListTile(
                                            title: Text(listaHome.name),
                                            trailing: const Icon(
                                                Icons.arrow_forward_ios),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
            ),
          ],
        ));
  }
}
