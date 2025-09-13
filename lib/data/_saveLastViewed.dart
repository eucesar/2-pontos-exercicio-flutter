// 3


import 'dart:convert'; 
// Para converter objetos em JSON (jsonEncode) e JSON em objetos (jsonDecode)

import 'package:shared_preferences/shared_preferences.dart'; 
// Biblioteca que permite salvar e ler dados simples no dispositivo, 
// como se fosse um banco de dados chave-valor (local storage).

import 'package:favorite_sports_98007/model/sports.dart'; 
// Importa o modelo Team, que será salvo/carregado.

class SaveLastViewed {
  // Chave usada para identificar o time salvo no SharedPreferences
  static const _key = 'favorite_sport';

  // Lê o time salvo do SharedPreferences
  Future<Sports?> geSport() async {
    final prefs = await SharedPreferences.getInstance(); 
    // Pega a instância do SharedPreferences

    final jsonStr = prefs.getString(_key); 
    // Busca a string salva na chave 'favorite_team'

    if (jsonStr == null) return null; 
    // Se não tiver nada salvo, retorna null

    try {
      // Converte a string JSON em Map
      final map = jsonDecode(jsonStr) as Map<String, dynamic>; 

      // Cria um objeto Team a partir do Map
      return Sports.fromJson(map); 
    } catch (_) {
      // Se der erro na conversão, retorna null
      return null;
    }
  }

  // Salva um time no SharedPreferences
  Future<void> setSports(Sports sport) async {
    final prefs = await SharedPreferences.getInstance(); 
    // Pega a instância do SharedPreferences

    await prefs.setString(
      _key, 
      jsonEncode(sport.toJson()), 
      // Converte o objeto Team para JSON (string) e salva
    );
  }

  // Remove o time salvo do SharedPreferences
  Future<void> clearSport() async {
    final prefs = await SharedPreferences.getInstance(); 
    // Pega a instância do SharedPreferences

    await prefs.remove(_key); 
    // Remove a chave 'favorite_team' e o valor associado
  }
}
