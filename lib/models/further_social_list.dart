class Article {
  final int id;
  final String title;
  final String urlImage;
  final String path;

  const Article({
    required this.id,
    required this.title,
    required this.urlImage,
    required this.path,
  });
}

List<Article> articlesList = [
  const Article(
      id: 5,
      title: 'Dimensions of social health',
      urlImage: 'assets/images/dim_social_health.jpg',
      path: '/further_read_diagnosis'
  ),
  const Article(
      id: 0,
      title: 'Strategies to improve',
      urlImage: 'assets/images/strategies_social.jpg',
      path: '/further_read_students'
  ),
  const Article(
      id: 1,
      title: 'Signs you are socially healthy',
      urlImage: 'assets/images/sign_socially.jpg',
      path: '/further_read_warnings'
  ),
  const Article(
      id: 2,
      title: 'Emotional well being',
      urlImage: 'assets/images/emotional_well.jpg',
      path: '/further_read_warnings'
  ),
];