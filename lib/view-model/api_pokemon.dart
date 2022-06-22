import 'dart:convert' as custom_api_fetch;
import 'dart:convert';
import 'package:http/http.dart';
import '../model/pokemon_model.dart';

Future<PokemonModel> apiPokemon({required String parametroUrl}) async {
  final url = parametroUrl; //"https://pokeapi.co/api/v2/pokemon/pikachu";
  final response = await get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(utf8.decode(response.bodyBytes));
    return PokemonModel.fromJson(responseBody);
  } else {
    throw Exception("Não foi possivel carregar os dados da Api");
  }
}

/*
Future apiPokemon({required String parametroUrl}) async{
  final url = parametroUrl;
  final response = await get(Uri.parse(url));
  if(response.statusCode == 200) {
    return custom_api_fetch.jsonDecode(response.body);
  } else {
    throw Exception("Não foi possivel carregar os dados da API");
  }
}

 */

