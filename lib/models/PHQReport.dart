// PHQ 9 report data
class Report {
  final int id;
  final String scoreRange;
  final String severity;
  final String treatment;
  final List<int> indices; // of suggestions from suggestions list (which has features)

  const Report({
    required this.id,
    required this.scoreRange,
    required this.severity,
    required this.treatment,
    required this.indices,
  });
}

List<Report> reportsList = [
  const Report(
      id: 0,
      scoreRange: '0-4',
      severity: 'None-minimal',
      treatment: 'None',
      indices: [5,],
  ),
  const Report(
    id: 0,
    scoreRange: '0-4',
    severity: 'None-minimal',
    treatment: 'None',
    indices: [5,],
  ),
  const Report(
    id: 0,
    scoreRange: '0-4',
    severity: 'None-minimal',
    treatment: 'None',
    indices: [5,],
  ),
  const Report(
    id: 0,
    scoreRange: '0-4',
    severity: 'None-minimal',
    treatment: 'None',
    indices: [5,],
  ),
  const Report(
    id: 0,
    scoreRange: '0-4',
    severity: 'None-minimal',
    treatment: 'None',
    indices: [5,],
  ),
];

class SuggestionFeatures {
  final int id;
  final String title;
  final String track;
  final String nextScreenRoute;

  const SuggestionFeatures({
    required this.id,
    required this.title,
    required this.track,
    required this.nextScreenRoute,
});
}

List<SuggestionFeatures> suggestions = [
  const SuggestionFeatures(
    id: 0,
    title: 'PHQ-9 Depression assessment',
    track: 'Mental Health',
    nextScreenRoute: '/phq_home'
  ),
  const SuggestionFeatures(
      id: 1,
      title: 'GAD-7 Anxiety assessment',
      track: 'Mental Health',
      nextScreenRoute: '/gad_home'
  ),
  const SuggestionFeatures(
      id: 2,
      title: 'Cognitive Behavioral Therapy',
      track: 'Mental Health',
      nextScreenRoute: '/cbt_home'
  ),
  const SuggestionFeatures(
      id: 3,
      title: 'Diaphragmatic breathing',
    track: 'Mental Health',
      nextScreenRoute: '/diaphragm_home',
  ),
  const SuggestionFeatures(
      id: 4,
      title: 'Meditation',
    track: 'Mental Health',
      nextScreenRoute: 'meditation_home',
  ),
  const SuggestionFeatures(
      id: 5,
      title: 'Mindfulness',
    track: 'Mental Health',
      nextScreenRoute: 'mindfulness_home',
  )
];