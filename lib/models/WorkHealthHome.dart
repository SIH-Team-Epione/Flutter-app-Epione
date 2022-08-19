// work health home page data
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

const title = 'Work Health';
const learnMoreText = 'A student''s life is largely governed of their school or university related work. Be it a high school student or a college going student, studies, projects, internships etc. take up most of their time. We wanted to factor in this aspect in our app as we strongly believe that this component is of equal significance when we talk about self care. Hence, we decided to add this unique dimension to our app dividing the features into two, namely, time management and concentration techniques. Head over to their pages to learn more about them!';
List<Feature> featuresList = [
  const Feature(
    id: 8,
    title: 'Pomodoro technique',
    description: '',
    urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
    nextScreenRoute: '/pomodoro'
  ),
  const Feature(
      id: 0,
      title: 'Pareto Analysis',
      description: '',
      urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
      nextScreenRoute: '/pareto'
  ),
  const Feature(
      id: 2,
      title: 'Eisenhower Matrix',
      description: '',
      urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
      nextScreenRoute: '/eisenhower'
  ),
  const Feature(
      id: 3,
      title: 'Parkinson’s Law',
      description: '',
      urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
      nextScreenRoute: '/pmr',
  ),
  const Feature(
    id: 4,
    title: 'Time Blocking Method',
    description: '',
    urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
    nextScreenRoute: '',
  ),
  const Feature(
    id: 5,
    title: 'Getting Things Done (GTD) Method',
    description: '',
    urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
    nextScreenRoute: '',
  ),
  const Feature(
    id: 6,
    title: 'Rapid Planning Method (RPM)',
    description: '',
    urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
    nextScreenRoute: '',
  ),
  const Feature(
    id: 7,
    title: 'Pickle Jar Theory',
    description: '',
    urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
    nextScreenRoute: '',
  ),
  const Feature(
    id: 1,
    title: 'Eat That Frog Technique',
    description: '',
    urlImage: 'assets/images/time_learn.jpg',
    ageGroup: 'Time Management',
    nextScreenRoute: '',
  ),
  const Feature(
    id: 9,
    title: 'Concentration Techniques',
    description: '',
    urlImage: 'assets/images/conc_learn.jpg',
    ageGroup: 'Concentration',
    nextScreenRoute: '/concentration_home',
  ),

];