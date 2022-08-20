// physical health home page data
import 'package:quiz_app/models/MentalHealthHome.dart' as mental;
import 'package:quiz_app/models/PhysicalHealthHome.dart' as physical;
import 'package:quiz_app/models/SocialHealthHome.dart' as social;
import 'package:quiz_app/models/WorkHealthHome.dart' as work;

 mental.Feature cbt = mental.featuresList[2];
 mental.Feature diabr = mental.featuresList[3];
 mental.Feature medit = mental.featuresList[4];
 mental.Feature mindf = mental.featuresList[5];

 physical.Feature yoga = physical.featuresList[0];
 physical.Feature exer = physical.featuresList[1];
 physical.Feature pmr = physical.featuresList[3];

social.Feature friends = social.featuresList[0];
social.Feature fam = social.featuresList[1];

work.Feature pomo = work.featuresList[0];
work.Feature pareto = work.featuresList[1];
work.Feature conc = work.featuresList[9];
work.Feature parkinson = work.featuresList[4];

class Category {
  final int id;
  final String range;
  final String depressionSeverity;
  final String treatmentAction;
  final List<mental.Feature> listMental;
  final List<physical.Feature> listPhysical;
  final List<social.Feature> listSocial;
  final List<work.Feature> listWork;

   Category({
    required this.id,
    required this.range,
    required this.depressionSeverity,
    required this.treatmentAction,
    required this.listMental,
    required this.listPhysical,
    required this.listSocial,
     required this.listWork,

  });
}
List<Category> catsList = [
  Category(
    id: 0,
    range:'0-4',
    depressionSeverity: 'None-minimal anxiety',
    treatmentAction: 'You do not have anxiety disorder, however to deal with the stress the following features are suggested. In this score range, it is advisable you use our features to improve your overall health.',
    listMental: [mindf, medit],
    listPhysical: [exer],
    listSocial: [],
    listWork: [pomo]
  ),
  Category(
    id: 1,
    range:'5-9',
    depressionSeverity: 'Mild anxiety',
    treatmentAction: 'Watchful waiting is required; repeat PHQ-9 for a follow-up. Follow the suggested features and monitor your improvement by giving this test again.',
    listMental: [diabr, medit],
    listPhysical: [yoga],
    listSocial: [friends],
    listWork: [pomo, pareto]
  ),
  Category(
    id: 2,
    range:'10-14',
    depressionSeverity: 'Moderate anxiety',
    treatmentAction: 'In this score range a treatment plan is needed, consider counseling, follow-up and/or pharmacotherapy using the doctor consultation feature. Start following the features of PMR, diaphragmatic breathing daily and contact a family member.',
    listMental: [diabr, medit],
    listPhysical: [pmr],
    listSocial: [fam],
    listWork: [pomo, parkinson]
  ),
  Category(
    id: 3,
    range:'15-21',
    depressionSeverity: 'Severe anxiety',
    treatmentAction: 'In this score range, immediate initiation of pharmacotherapy is needed and, if severe impairment or poor response to therapy, expedited contact with a mental health specialist for psychotherapy and/or collaborative management is a must. Start following Progressive Muscle Relaxation, Yoga, Diaphragmatic breathing, and Cognitive behavioral therapy daily.',
    listMental: [cbt, medit,  diabr],
    listPhysical: [pmr, exer, yoga],
    listSocial: [fam, friends],
    listWork: [pomo, pareto, conc]
  ),

];