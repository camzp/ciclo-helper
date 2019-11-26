class Manual {
  final String imageUrl;
  final String titulo;
  final String subtitulo;
  final String descricao;

  Manual({
    this.titulo,
    this.subtitulo,
    this.descricao,
    this.imageUrl,
  });
}

final List<Manual> manuals = [
  Manual(
    imageUrl: 'assets/cuidados_bike.jpeg',
    titulo: 'Cuidados com a Bike',
    subtitulo: 'Cuidados',
    descricao: 'Minha bike é muito legal!',
  ),
  Manual(
    imageUrl: '',
    titulo: '',
    subtitulo: '',
    descricao: '',
  ),
];