import 'dart:io';
import 'dart:convert';
import 'package:api_pokemon/components/custom_appbar.dart';
import 'package:api_pokemon/components/custom_button_navigation.dart';
import 'package:api_pokemon/components/custom_icon_button.dart';
import 'package:api_pokemon/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


void main() {
  /*
  setUpAll(nock.init);

  setUp(() {
    nock.cleanAll();
  });

   */



  testWidgets("Deve aparecer a customAppbar o texto Poke App", (widgetTester) async{
    await widgetTester.pumpWidget(MaterialApp(home: Home(),));
    final testeAppbar = find.widgetWithText(customAppbar, "Poke App");
    expect(testeAppbar, findsOneWidget);
  });

  testWidgets("Deve aparecer o TextField com o texto Procurar pelo pokemon", (widgetTester) async{
    await widgetTester.pumpWidget(MaterialApp(home: Home(),));
    final teste = find.widgetWithText( TextField, "Procurar pelo pokemon");
    expect(teste, findsOneWidget);
  });

/*
  testWidgets('http widget-test does not work', (WidgetTester tester) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=10'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    print('BODY: $responseBody');
  });

 */
}



/*

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });
  testWidgets('http', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final HttpClient client = HttpClient();
      final HttpClientRequest request =
      await client.getUrl(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=10'));

      final HttpClientResponse response = await request.close();
      print(response.statusCode); // Should get 200

      await tester.pumpWidget(MaterialApp(home: Home(),));
      final teste = find.byType( CircularProgressIndicator);
      expect(teste, findsOneWidget);

      await tester.pumpAndSettle();

      final teste1 = find.byType( customIcomButton);
      expect(teste1, findsOneWidget);
    });
  });
}

 */