class Manual {
  final String imageUrl;
  final String titulo;
  final String subtitulo;
  final String description;

  Manual({
    this.titulo,
    this.subtitulo,
    this.description,
    this.imageUrl,
  });
}

final List<Manual> manuals = [
  Manual(
    imageUrl: 'assets/cuidados_bike.jpeg',
    titulo: 'Cuidados com a Bike',
    subtitulo: 'Cuidados',
    description: 'Minha bike é muito legal!',
  ),
  Manual(
    imageUrl: 'assets/cuidados_bike.jpeg',
    titulo: 'Cuidados com a Bike',
    subtitulo: 'Cuidados',
    description: 'Minha bike é muito legal!',
  ),
];