import 'dart:convert';
import 'package:http/http.dart';
import '../model/home_model.dart';


Future<HomeModel> apiHome({required String parametroUrl}) async{
  final url = parametroUrl;
  final response = await get(Uri.parse(url));
  if(response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(utf8.decode(response.bodyBytes));
    return HomeModel.fromJson(responseBody);
  } else {
    throw Exception("Não foi possivel carregar os dados da Api");
  }
}

