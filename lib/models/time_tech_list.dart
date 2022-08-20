// physical health home page data
class Technique {
  final String title;
  final String description;
  final String howto;
  final String urlImage;
  final String urlVideo;

  const Technique({
    required this.title,
    required this.description,
    required this.howto,
    required this.urlImage,
    required this.urlVideo,
  });
}

List<Technique> techsList = [
  const Technique(
    title: 'Pareto Analysis',
    description: 'The 80/20 rule is a technique created by the Italian economist Vilfredo Pareto. It’s the idea that 20% of actions are responsible for 80% of outcomes. The goal of Pareto analysis is to help you prioritize tasks that are most effective at solving problems.',
    urlImage: 'assets/images/learn_pareto.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=Q5GAH0yMzwk',
      howto: "List some of the problems you are facing. For example, maybe your grades are slipping."+
          "\n\n1. Identify the root cause of each problem. Maybe your grades are slipping because you spend too much time on social media or any other sort of distraction."+
          "\n\n2. Assign a score to each problem: Assign higher numbers to more important problems"+
          '\n\n3. Group problems together by cause: Group together all the problems caused by spending too much time on social media.'+
          '\n\n 4. Add up the score of each group: The group with the highest score is the issue you should work on first.'+
          '\n\n5. Take action.\n',
  ),
  const Technique(
    title: 'Eisenhower Matrix',
    description: 'The 80/20 rule is a technique created by the Italian economist Vilfredo Pareto. It’s the idea that 20% of actions are responsible for 80% of outcomes. The goal of Pareto analysis is to help you prioritize tasks that are most effective at solving problems.',
    urlImage: 'assets/images/learn_pareto.jpg',
    urlVideo: 'https://www.youtube.com/watch?v=Q5GAH0yMzwk',
    howto: "List some of the problems you are facing. For example, maybe your grades are slipping."+
        "\n\n1. Identify the root cause of each problem. Maybe your grades are slipping because you spend too much time on social media or any other sort of distraction."+
        "\n\n2. Assign a score to each problem: Assign higher numbers to more important problems"+
        '\n\n3. Group problems together by cause: Group together all the problems caused by spending too much time on social media.'+
        '\n\n 4. Add up the score of each group: The group with the highest score is the issue you should work on first.'+
        '\n\n5. Take action.\n',
  ),


];