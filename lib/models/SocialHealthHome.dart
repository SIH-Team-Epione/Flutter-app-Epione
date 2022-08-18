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

const title = 'Social Health';
const learnMoreText = 'Another aspect that we wanted to cover in our app, one that is often neglected, is that of social health. Social wellness involves building healthy, nurturing, and supportive relationships as well as fostering a genuine connection with those around you. Conscious actions are important in learning how to balance your social life with your academic and professional lives.';

List<Feature> featuresList = [
  const Feature(
    id: 0,
    title: 'Connect with friends',
    description: 'Friends also play a significant role in promoting your overall health. Strong Social Connections Help Offset Stressors in Your Life. They are the ones who stay with you through thick and thin and know you the best. So, take out time from your schedule and talk to a friend now to boost your happy hormones!',
    urlImage: 'assets/images/friend_list.jpg',
    ageGroup: 'All ages',
    nextScreenRoute: '/connect_friends'
  ),
  const Feature(
      id: 1,
      title: 'Connect with family',
      description: 'Owing to our jam-packed schedules we often tend to forget about our family, even when we''re living under the same roof! Good family communications bring a sense of togetherness, security and contributes to our happiness. This feature would remind you that as part of your self-care journey, you can connect with your loved ones, seek their support and comfort and stay connected.',
      urlImage: 'assets/images/family_list.jpg',
    ageGroup: 'All ages',
      nextScreenRoute: '/connect_family'
  ),
  const Feature(
      id: 2,
      title: 'Developing communication skills',
      description: '',
      urlImage: 'assets/images/communication_list.jpg',
    ageGroup: 'All ages',
      nextScreenRoute: '/communication_skills'
  ),

];