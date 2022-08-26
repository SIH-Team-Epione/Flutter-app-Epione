// physical health home page data
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
    urlImage: 'assets/images/yoga_list.jpg',
    ageGroup: '7 above',
    nextScreenRoute: '/yoga'
  ),
  const Feature(
      id: 1,
      title: 'Guide to Physical Well Being',
      description: 'Track your sleep quality, heartbeat count and the daily step count by using this feature which uses plugins to integrate these health details in the app.',
      urlImage: 'assets/images/exercise_list.jpg',
    ageGroup: '10 above',
      nextScreenRoute: '/exercises'
  ),
  const Feature(
      id: 2,
      title: 'Diets',
      description: 'Try out the diet plans available from our list which are easy to follow and custom tailored according to age group.',
      urlImage: 'assets/images/diets_list.jpg',
    ageGroup: 'All ages',
      nextScreenRoute: '/diets'
  ),
  const Feature(
      id: 3,
      title: 'Progressive Muscle Relaxation',
      description: 'PMR is a deep relaxation technique that has been effectively used to control stress and anxiety, relieve insomnia. Try our guided PMR technique!',
      urlImage: 'assets/images/pmr_list.jpg',
    ageGroup: 'All ages',
      nextScreenRoute: '/pmr',
  ),

];