// mental health home page data
class Feature {
  final int id;
  final String title;
  final String description;
  final String urlImage;
  final String ageGroup;
  final String nextScreenRoute;

  const Feature({
    required this.id,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.ageGroup,
    required this.nextScreenRoute,
  });
}

const title = 'Physical Health';
const learnMoreText = 'Mental health disorders are not uncommon amongst students and its prevalence imposes many challenges and thus being aware and knowing how to tackle...';

List<Feature> featuresList = [
  const Feature(
    id: 0,
    title: 'PHQ-9 Depression assessment',
    description: 'The 9-question Patient Health Questionnaire is a diagnostic tool to screen patients for severity of depression. You can easily take this professional assessment to get recommendations based on your scores.',
    urlImage: 'assets/images/phq_list_image.png',
    ageGroup: '12 above',
    nextScreenRoute: '/phq_home'
  ),
  const Feature(
      id: 1,
      title: 'GAD-7 Anxiety assessment',
      description: 'Generalized Anxiety Disorder 7 is a self reported questionnaire for screening and severity measuring of generalized anxiety disorder. Take this test to receive treatment recommendations.',
      urlImage: 'assets/images/gad_list_image.png',
    ageGroup: '12 above',
      nextScreenRoute: '/gad_home'
  ),
  const Feature(
      id: 2,
      title: 'Cognitive Behavioral Therapy',
      description: 'Learn cognitive restructuring to identify and destruct negative thought patterns using techniques such as Rational Emotive behaviour therapy, multimodal therapy, etc.',
      urlImage: 'assets/images/cbt_list_image.jpeg',
    ageGroup: 'All ages',
      nextScreenRoute: '/cbt_home'
  ),
  const Feature(
      id: 3,
      title: 'Diaphragmatic breathing',
      description: 'Diaphragmatic breathing is an effective deep breathing technique to tackle anxiety. Use this feature to perform the guided exercise.',
      urlImage: 'assets/images/diaphragm_list_image.jpg',
    ageGroup: 'All ages',
      nextScreenRoute: '/diaphragm_home',
  ),
  const Feature(
      id: 4,
      title: 'Meditation',
      description: 'Meditation can give you a sense of calm, peace and balance that can benefit both your emotional well-being and your overall health. You can also use it to relax and cope with stress by refocusing your attention on something calming.',
      urlImage: 'assets/images/meditation_list_image.jpg',
    ageGroup: '15 above',
      nextScreenRoute: '/meditation_home',
  ),
  const Feature(
      id: 5,
      title: 'Mindfulness',
      description: 'Mindfulness is a technique by which you can learn to be fully present and engaged in the moment without judging anything. It can help you manage your thoughts, feelings and mental health.',
      urlImage: 'assets/images/mindfulness_list_image.jpg',
    ageGroup: '15 above',
      nextScreenRoute: '/mindfulness_home',
  )
];