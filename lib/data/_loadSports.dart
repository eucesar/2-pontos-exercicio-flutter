// 2° parte

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:favorite_sports_98007/model/sports.dart';

class SportRepository {
  final String assetPath;

  SportRepository({this.assetPath = 'assets/data/sports.json'});

  Future<List<Sports>> load() async {
    // Carrega o JSON do arquivo em assets
    final jsonStr = await rootBundle.loadString(assetPath);

    // Decodifica a string JSON em uma lista dinâmica
    final list = jsonDecode(jsonStr) as List;

    // Converte cada item do JSON em um objeto Team
    return list
        .map((e) => Sports.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
