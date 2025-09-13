import 'package:flutter/material.dart';
import 'package:favorite_sports_98007/model/sports.dart';

class SportDetailScreen extends StatelessWidget {
  const SportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    if (args == null || args is! Sports) {
      return const Scaffold(
        body: Center(
          child: Text("Nenhum esporte recebido."),
        ),
      );
    }

    final sport = args as Sports;

    return Scaffold(
      appBar: AppBar(title: Text(sport.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(sport.image, width: 150, height: 150),
            ),
            const SizedBox(height: 16),
            Text(
              sport.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Text(
              "Popularidade: ${sport.popularity}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
