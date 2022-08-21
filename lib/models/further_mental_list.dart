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
      title: 'Diagnosis and Treatment',
      urlImage: 'assets/images/diagnosis_treatment.jpg',
      path: '/further_read_diagnosis'
  ),
  const Article(
      id: 0,
      title: 'Relevance for students',
      urlImage: 'assets/images/students.jpg',
      path: '/further_read_students'
  ),
  const Article(
      id: 1,
      title: 'Early warning signs',
      urlImage: 'assets/images/warning.jpg',
      path: '/further_read_warnings'
  ),
  const Article(
      id: 2,
      title: 'Myth vs Fact',
      urlImage: 'assets/images/myth_vs_fact.jpg',
      path: '/further_read_myth'
  ),
  const Article(
    id: 3,
      title: 'Suicide prevention',
      urlImage: 'assets/images/suicide_prevention.jpg',
      path: '/further_read_suicide'
  ),
  const Article(
    id: 4,
      title: 'Types',
      urlImage: 'assets/images/types.jpg',
      path: '/further_read_types'
  ),
  const Article(
      id: 6,
      title: 'What is Meditation?',
      urlImage: 'assets/images/meditation_learn.jpg',
      path: '/further_read_meditation'
  ),
  const Article(
      id: 7,
      title: 'How mindfulness helps',
      urlImage: 'assets/images/mindfulness_learn.jpg',
      path: '/further_read_mindfulness'
  ),

];