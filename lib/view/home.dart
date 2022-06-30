import 'package:api_pokemon/components/custom_appbar.dart';
import 'package:api_pokemon/components/custom_button_navigation.dart';
import 'package:api_pokemon/components/custom_icon_button.dart';
import 'package:api_pokemon/model/home_model.dart';
import 'package:api_pokemon/model/pokemon_model.dart';
import 'package:api_pokemon/view-model/api_home.dart';
import 'package:api_pokemon/view-model/api_pokemon.dart';
import 'package:api_pokemon/view/pokemon.dart';
import 'package:flutter/material.dart';
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
    return customAppbar(
      body: Column(
        children: [
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration:
                  const InputDecoration(hintText: "Procurar pelo pokemon"),
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
                                        customButtomNavigation(
                                          nome: listaHome.results[index].name,
                                          onClick: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Personagem(
                                                        nome: listaHome
                                                            .results[index]
                                                            .name),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customIcomButton(
                                  Icons: Icons.arrow_back,
                                  onClick: () {
                                    setState(() {
                                      url = listaHome.previous != null
                                          ? listaHome.previous
                                          : "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10";
                                    });
                                  },
                                ),
                                customIcomButton(
                                  Icons: Icons.arrow_forward,
                                  onClick: () {
                                    setState(() {
                                      url = listaHome.next;
                                    });
                                  },
                                ),
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
                        return telaErro(
                          namePerson: namePerson,
                        );
                      } else if (snapshot.hasData) {
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
                                              builder: (context) => Personagem(
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
      ),
    );
  }
}
