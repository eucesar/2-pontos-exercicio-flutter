import 'package:flutter/material.dart';
import 'package:favorite_sports_98007/routes.dart';

void main() {
  // Função principal do app → executa o MyApp
  runApp(const MyApp());
}

// Widget raiz do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Nome do aplicativo (usado em alguns lugares do sistema)
      title: 'Time Favorito',

      // Tema padrão → azul
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Define qual rota será aberta primeiro → HomeScreen
      initialRoute: Routes.list,

      // Define como as rotas serão geradas dinamicamente
      onGenerateRoute: Routes.generateRoute,

      // Remove a faixa de "debug" vermelha no canto superior direito
      debugShowCheckedModeBanner: false,
    );
  }
}
