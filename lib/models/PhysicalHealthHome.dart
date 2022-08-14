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
const learnMoreText = 'Physical health forms a core component of your self-care journey as a student. The benefits of physical activity for school-aged as well as college going students are proven. Healthy school environments help students achieve their academic potential and support the development of life-long healthy habits. ';
List<Feature> featuresList = [
  const Feature(
    id: 0,
    title: 'Yoga Pose Detection',
    description: 'Practice Yoga daily using our real-time pose detection feature which gives you an accuracy to guide you and make yoga fun and interactive!',
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