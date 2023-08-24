enum ProjectType {
  // ignore: constant_identifier_names
  total(title: "Total", key: "totalProjectList", isApproved: true),
  onGoing(title: "On Going", key: "onGoingProjectList", isApproved: true),
  completed(title: "Completed", key: "completedProjectList", isApproved: true),

  inPreparation(title: "In Preparation", key: "inPreparationProjectList", isApproved: true),
  forRecast(title: "For Recast", key: "forRecastProjectList", isApproved: true),
  inMinistry(title: "In Ministry", key: "inMinistryProjectList", isApproved: true),
  inPlanningCommission(title: "In Planning Commission", key: "inPlanningCommissionProjectList", isApproved: true),
  inECNEC(title: "In ECNEC", key: "inEcnecProjectList", isApproved: true),
  ;

  const ProjectType({required this.title, required this.key, required this.isApproved});

  final String title;
  final String key;
  final bool isApproved;
}

ProjectType projectTypeFromTitle(String title) {
  return ProjectType.values.firstWhere((element) => element.title == title);
}
