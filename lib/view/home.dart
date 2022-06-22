import 'package:api_pokemon/model/home_model.dart';
import 'package:api_pokemon/view-model/api_home.dart';
import 'package:api_pokemon/view/pokemon.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Poke App"),
          centerTitle: true,
        ),
        body: FutureBuilder<HomeModel>(
          future: apiHome(parametroUrl: url),
          builder: (context, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Personagem(
                                              nome: listaHome
                                                  .results[index].name)),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(width: 0.6),
                                          bottom: BorderSide(width: 0.6)),
                                    ),
                                    child: ListTile(
                                      title:
                                          Text(listaHome.results[index].name),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ));
  }
}
