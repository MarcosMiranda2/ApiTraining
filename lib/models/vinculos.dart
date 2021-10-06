class Vinculos {
  final bool active;
  final String typeVinculo;
  final String course;

  Vinculos(
      {required this.active, required this.typeVinculo, required this.course});

  factory Vinculos.fromJson(Map<String, dynamic> json) => Vinculos(
      active: json['ativo'],
      typeVinculo: json['tipo-vinculo'],
      course: json['lotacao']);

  Map<String, dynamic> toJson() => {
        'ativo': active,
        'tipo-vinculo': typeVinculo,
        'lotacao': course,
      };
}
