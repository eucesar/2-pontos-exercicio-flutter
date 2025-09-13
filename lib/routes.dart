import 'package:flutter/material.dart';
import 'package:favorite_sports_98007/screens/list/sport_list_screen.dart';
import 'package:favorite_sports_98007/screens/detail/sport_detail_screen.dart';

class Routes {
  // Nome da rota inicial (HomeScreen)
  static const String list = '/';

  // Nome da rota da tela de seleção (SelectScreen)
  static const String detail = '/details';

  // Função que gera as rotas dinamicamente com base no nome
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Se a rota pedida for "/", abre a HomeScreen
      case list:
        return MaterialPageRoute(
          builder: (_) => SportListScreen(),
        );

      // Se a rota pedida for "/select", abre a SelectScreen
      case detail:
        return MaterialPageRoute(
          builder: (_) => SportDetailScreen(),
        );

      // Se a rota não for encontrada, mostra uma tela de erro simples
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota não encontrada!'),
            ),
          ),
        );
    }
  }
}
