class Manual {
  final String imageUrl;
  final String titulo;
  final String subtitulo;
  final String descricao;
  final String siteUrl;

  Manual({
    this.titulo,
    this.subtitulo,
    this.descricao,
    this.imageUrl,
    this.siteUrl,
  });
}

final List<Manual> manuals = [
  Manual(
    imageUrl: 'assets/cuidados_bike.jpeg',
    titulo: 'Cuidados com a Bike',
    subtitulo: 'Cuidados',
    descricao: 'Minha bike é muito legal!',
    siteUrl: 'http://blog.bikeregistrada.com.br/conheca-6-cuidados-para-conservar-sua-bicicleta/',
  ),
  Manual(
    imageUrl: 'assets/corrente-wiki.jpg',
    titulo: 'Troca de corrente',
    subtitulo: ' ',
    descricao: 'Ensina a trocar a corrente da Bike',
    siteUrl: 'https://pt.wikihow.com/Consertar-uma-Corrente-de-Bicicleta-Solta',
  ),
  Manual(
    imageUrl: '',
    titulo: 'Troca de pneu',
    subtitulo: ' ',
    descricao: 'Ensina a trocar pneu da bike',
    siteUrl: 'https://pt.wikihow.com/Trocar-o-Pneu-de-uma-Bicicleta',
  )
];