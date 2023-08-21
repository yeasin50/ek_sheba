enum ProjectType {
  // ignore: constant_identifier_names
  total(title: "Total", key: "totalProjectList", isApproved: true),
  onGoing(title: "On Going", key: "onGoingProjectList", isApproved: true),
  completed(title: "Completed", key: "completedProjectList", isApproved: true),

  inPreparation(title: "In Preparation", key: "InPreparation", isApproved: true),
  forRecast(title: "For Recast", key: "ForRecast", isApproved: true),
  inMinistry(title: "In Ministry", key: "InMinistry", isApproved: true),
  inPlanningCommission(title: "In Planning Commission", key: "InPlanningCommission", isApproved: true),
  inECNEC(title: "In ECNEC", key: "InECNEC", isApproved: true),
  ;

  const ProjectType({required this.title, required this.key, required this.isApproved});

  final String title;
  final String key;
  final bool isApproved;
}
