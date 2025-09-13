import 'package:flutter/material.dart';
import 'package:favorite_sports_98007/data/_loadSports.dart';
import 'package:favorite_sports_98007/data/_saveLastViewed.dart';
import 'package:favorite_sports_98007/model/sports.dart';
import 'package:favorite_sports_98007/routes.dart';

class SportListScreen extends StatefulWidget {
  const SportListScreen({super.key});

  @override
  State<SportListScreen> createState() => _SportListScreenState();
}

class _SportListScreenState extends State<SportListScreen> {
  final sportRepo = SportRepository();     // carrega JSON
  final saveRepo = SaveLastViewed();       // persiste último visto

  Future<List<Sports>>? _futureSports;
  Future<Sports?>? _futureLast;

  @override
  void initState() {
    super.initState();
    _futureSports = sportRepo.load();      // carrega lista do JSON
    _futureLast = saveRepo.geSport();      // pega último visto salvo
  }

  void _openDetails(Sports sport) async {
    await saveRepo.setSports(sport);       // salva último visto
    if (mounted) {
      Navigator.pushNamed(
        context,
        Routes.detail,
        arguments: sport,                  // <-- sempre manda o objeto
      ).then((_) {
        setState(() => _futureLast = saveRepo.geSport()); // atualiza seção
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Esportes")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Último visto
          FutureBuilder<Sports?>(
            future: _futureLast,
            builder: (context, snap) {
              if (!snap.hasData) {
                return const ListTile(
                  title: Text("Nenhum esporte visto ainda"),
                );
              }
              final sport = snap.data!;
              return ListTile(
                leading: Image.asset(sport.image, width: 40),
                title: Text("Último visto: ${sport.name}"),
                onTap: () => _openDetails(sport), // abre detalhe do último visto
              );
            },
          ),
          const Divider(),
          // Lista de esportes carregados do JSON
          Expanded(
            child: FutureBuilder<List<Sports>>(
              future: _futureSports,
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final sports = snap.data!;
                return ListView.builder(
                  itemCount: sports.length,
                  itemBuilder: (context, index) {
                    final sport = sports[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(sport.image, width: 40),
                        title: Text(sport.name),
                        subtitle: Text(sport.description),
                        onTap: () => _openDetails(sport), // passa o objeto certo
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
