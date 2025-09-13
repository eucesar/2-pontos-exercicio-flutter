//1° esse

class Sports {
  // Propriedades do time
  final int id;      // Identificador único do time
  final String image; // Nome do time
  final String name; // Caminho da imagem/logo do time
  final String description; // Caminho da imagem/logo do time
  final String popularity;
 

  // Construtor do Team (obrigatório passar os 3 atributos)
  Sports({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.popularity,

  });

  // Construtor de fábrica que cria um Team a partir de um JSON (Map)
  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        id: json['id'] as int,
        image: json['image'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        popularity: json['popularity'] as String,
      );

  // Converte o objeto Team para JSON (Map), útil para salvar em SharedPreferences
  Map<String, dynamic> toJson() => {
        'id': id,
        'images': image,
        'name': name,
        'description': description,
        'popularity': popularity,
      };
}
