class Usuario {
  final int id;
  final String nome;

  Usuario({
    required this.id,
    required this.nome,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json['id-usuario'],
        nome: json['nome-pessoa'],
      );

  Map<String, dynamic> toJson() => {
        'id-usuario': id,
        'nome-pessoa': nome,
      };
}
