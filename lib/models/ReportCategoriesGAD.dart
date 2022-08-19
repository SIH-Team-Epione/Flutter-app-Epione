// physical health home page data
import 'package:quiz_app/models/MentalHealthHome.dart' as mental;
import 'package:quiz_app/models/PhysicalHealthHome.dart' as physical;
import 'package:quiz_app/models/SocialHealthHome.dart' as social;
import 'package:quiz_app/models/WorkHealthHome.dart';

 mental.Feature cbt = mental.featuresList[2];
 mental.Feature diabr = mental.featuresList[3];
 mental.Feature medit = mental.featuresList[4];
 mental.Feature mindf = mental.featuresList[5];

 physical.Feature yoga = physical.featuresList[0];
 physical.Feature exer = physical.featuresList[1];
 physical.Feature pmr = physical.featuresList[3];

social.Feature friends = social.featuresList[0];
social.Feature fam = social.featuresList[1];

class Category {
  final int id;
  final String range;
  final String depressionSeverity;
  final String treatmentAction;
  final List<mental.Feature> listMental;
  final List<physical.Feature> listPhysical;
  final List<social.Feature> listSocial;

   Category({
    required this.id,
    required this.range,
    required this.depressionSeverity,
    required this.treatmentAction,
    required this.listMental,
    required this.listPhysical,
    required this.listSocial,

  });
}
List<Category> catsList = [
  Category(
    id: 0,
    range:'0-4',
    depressionSeverity: 'None-minimal',
    treatmentAction: 'None',
    listMental: [mindf],
    listPhysical: [exer],
    listSocial: [],
  ),
  Category(
    id: 1,
    range:'5-9',
    depressionSeverity: 'Mild',
    treatmentAction: 'Watchful waiting; repeat PHQ-9 at follow-up',
    listMental: [diabr, medit],
    listPhysical: [yoga],
    listSocial: [],
  ),
  Category(
    id: 2,
    range:'10-14',
    depressionSeverity: 'Moderate',
    treatmentAction: 'Treatment plan, considering counseling, follow-up and/or pharmacotherapy',
    listMental: [diabr, medit],
    listPhysical: [pmr],
    listSocial: [fam],
  ),
  Category(
    id: 3,
    range:'15-19',
    depressionSeverity: 'Moderately severe',
    treatmentAction: 'Active treatment with pharmacotherapy and/or psychotherapy',
    listMental: [medit, diabr, cbt],
    listPhysical: [pmr, yoga],
    listSocial: [friends, fam],
  ),
  Category(
    id: 3,
    range:'20-27',
    depressionSeverity: 'Severe',
    treatmentAction: 'Immediate initiation of pharmacotherapy and, if severe impairment or poor response to therapy, expedited referral to a mental health specialist for psychotherapy and/or collaborative management',
    listMental: [cbt, medit,  diabr],
    listPhysical: [pmr, exer, yoga],
    listSocial: [fam, friends],
  ),

];