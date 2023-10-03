import 'dart:convert';

class PDFParams {
  final fileName;
  final templateName;
  final lng;
  final agency;
  final sectorDivision;
  final projectSummary;
  final getByProjectConcept;
  final estimatedProjectCost;

  final totalAmount;
  final gobAmount;
  final gobFeAmount;
  final paAmount;
  final paRpaAmount;
  final ownFundAmount;
  final ownFeAmount;

  ///
  final othersAmount;
  final otherFeAmount;

  final fiscalYearsList;
  final upazilas;
  final projectAreaJustification;

  final revenueList;

  final revenueTotal;
  final capitalList;
  final capitalTotal;
  final physicalContingencyTotal;
  final priceContingencyTotal;
  final grantTotal;
  final projectManagement;

  final getLogFrame;
  final view;
  final print_r;
  final key;

  const PDFParams({
    required this.fileName,
    required this.templateName,
    required this.lng,
    required this.agency,
    required this.sectorDivision,
    required this.projectSummary,
    required this.getByProjectConcept,
    required this.estimatedProjectCost,
    required this.totalAmount,
    required this.gobAmount,
    required this.gobFeAmount,
    required this.paAmount,
    required this.paRpaAmount,
    required this.ownFundAmount,
    required this.ownFeAmount,
    required this.othersAmount,
    required this.otherFeAmount,
    required this.fiscalYearsList,
    required this.upazilas,
    required this.projectAreaJustification,
    required this.revenueList,
    required this.revenueTotal,
    required this.capitalList,
    required this.capitalTotal,
    required this.physicalContingencyTotal,
    required this.priceContingencyTotal,
    required this.grantTotal,
    required this.projectManagement,
    required this.getLogFrame,
    required this.view,
    required this.print_r,
    required this.key,
  });

  //generate to map
  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'templateName': templateName,
      'lng': lng,
      'agency': agency,
      'sectorDivision': sectorDivision,
      'projectSummary': projectSummary,
      'getByProjectConcept': getByProjectConcept,
      'estimatedProjectCost': estimatedProjectCost,
      'totalAmount': totalAmount,
      'gobAmount': gobAmount,
      'gobFeAmount': gobFeAmount,
      'paAmount': paAmount,
      'paRpaAmount': paRpaAmount,
      'ownFundAmount': ownFundAmount,
      'ownFeAmount': ownFeAmount,
      'othersAmount': othersAmount,
      'otherFeAmount': otherFeAmount,
      'fiscalYearsList': fiscalYearsList,
      'upazilas': upazilas,
      'projectAreaJustification': projectAreaJustification,
      'revenueList': revenueList,
      'revenueTotal': revenueTotal,
      'capitalList': capitalList,
      'capitalTotal': capitalTotal,
      'physicalContingencyTotal': physicalContingencyTotal,
      'priceContingencyTotal': priceContingencyTotal,
      'grantTotal': grantTotal,
      'projectManagement': projectManagement,
      'getLogFrame': getLogFrame,
      'view': view,
      'print_r': print_r,
      'key': key,
    };
  }

  //generate to json
  String toJson() => json.encode(toMap());

  //generate from json
  factory PDFParams.fromJson(String source) =>
      PDFParams.fromMap(json.decode(source));

  //generate from map
  factory PDFParams.fromMap(Map<String, dynamic> map) {
    return PDFParams(
      ownFundAmount: map['ownFundAmount'],
      ownFeAmount: map['ownFeAmount'],
      othersAmount: map['othersAmount'],
      otherFeAmount: map['otherFeAmount'],
      fiscalYearsList: map['fiscalYearsList'],
      upazilas: map['upazilas'],
      projectAreaJustification: map['projectAreaJustification'],
      revenueList: map['revenueList'],
      revenueTotal: map['revenueTotal'],
      capitalList: map['capitalList'],
      capitalTotal: map['capitalTotal'],
      physicalContingencyTotal: map['physicalContingencyTotal'],
      priceContingencyTotal: map['priceContingencyTotal'],
      grantTotal: map['grantTotal'],
      projectManagement: map['projectManagement'],
      getLogFrame: map['getLogFrame'],
      view: map['view'],
      print_r: map['print_r'],
      key: map['key'],
      fileName: map['fileName'],
      templateName: map['templateName'],
      lng: map['lng'],
      agency: map['agency'],
      sectorDivision: map['sectorDivision'],
      projectSummary: map['projectSummary'],
      getByProjectConcept: map['getByProjectConcept'],
      estimatedProjectCost: map['estimatedProjectCost'],
      totalAmount: map['totalAmount'],
      gobAmount: map['gobAmount'],
      gobFeAmount: map['gobFeAmount'],
      paAmount: map['paAmount'],
      paRpaAmount: map['paRpaAmount'],
    );
  }

  //encoded for url on http body POST, handle if value is nested Map
  String toUrlEncoded() {
    return "fileName=${this.fileName}&templateName=${this.templateName}&lng=${this.lng}&agency=${this.agency}&sectorDivision=${this.sectorDivision}&projectSummary=${this.projectSummary}&getByProjectConcept=${this.getByProjectConcept}&estimatedProjectCost=${this.estimatedProjectCost}&totalAmount=${this.totalAmount}&gobAmount=${this.gobAmount}&gobFeAmount=${this.gobFeAmount}&paAmount=${this.paAmount}&paRpaAmount=${this.paRpaAmount}&ownFundAmount=${this.ownFundAmount}&ownFeAmount=${this.ownFeAmount}&othersAmount=${this.othersAmount}&otherFeAmount=${this.otherFeAmount}&fiscalYearsList=${this.fiscalYearsList}&upazilas=${this.upazilas}&projectAreaJustification=${this.projectAreaJustification}&revenueList=${this.revenueList}&revenueTotal=${this.revenueTotal}&capitalList=${this.capitalList}&capitalTotal=${this.capitalTotal}&physicalContingencyTotal=${this.physicalContingencyTotal}&priceContingencyTotal=${this.priceContingencyTotal}&grantTotal=${this.grantTotal}&projectManagement=${this.projectManagement}&getLogFrame=${this.getLogFrame}&view=${this.view}&print_r=${this.print_r}&key=${this.key}";
  }
}
