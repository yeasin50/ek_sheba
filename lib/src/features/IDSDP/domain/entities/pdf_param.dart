import 'dart:convert';

class PDFParams {
  final String fileName;
  final String templateName;
  final String lng;
  final String agency;
  final String sectorDivision;
  final String projectSummary;
  final String getByProjectConcept;
  final String estimatedProjectCost;

  final String totalAmount;
  final String gobAmount;
  final String gobFeAmount;
  final String paAmount;
  final String paRpaAmount;
  final String ownFundAmount;
  final String ownFeAmount;

  ///
  final String othersAmount;
  final String otherFeAmount;

  final String fiscalYearsList;
  final String upazilas;
  var projectAreaJustification;

  final String revenueList;

  var revenueTotal;
  final String capitalList;
  var capitalTotal;
  var physicalContingencyTotal;
  var priceContingencyTotal;
  var grantTotal;
  final  String projectManagement;

  final String getLogFrame;
  final String view;
  final String print_r;
  final String key;

  PDFParams({
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

  factory PDFParams.fromMap(Map<String, dynamic> map) {
    return PDFParams(
      fileName: "${map['fileName']}",
      templateName: "${map['templateName']}",
      lng: "${map['lng']}",
      agency: "${map['agency']}",
      sectorDivision: "${map['sectorDivision']}",
      projectSummary: "${map['projectSummary']}",
      getByProjectConcept: "${map['getByProjectConcept']}",
      estimatedProjectCost: "${map['estimatedProjectCost']}",
      totalAmount: "${map['totalAmount']}",
      gobAmount: "${map['gobAmount']}",
      gobFeAmount: "${map['gobFeAmount']}",
      paAmount: "${map['paAmount']}",
      paRpaAmount: "${map['paRpaAmount']}",
      ownFundAmount: "${map['ownFundAmount']}",
      ownFeAmount: "${map['ownFeAmount']}",
      othersAmount: "${map['othersAmount']}",
      otherFeAmount: "${map['otherFeAmount']}",
      fiscalYearsList: "${map['fiscalYearsList']}",
      upazilas: "${map['upazilas']}",
      projectAreaJustification: "${map['projectAreaJustification']}",
      revenueList: "${map['revenueList']}",
      revenueTotal: "${map['revenueTotal']}",
      capitalList: "${map['capitalList']}",
      capitalTotal: "${map['capitalTotal']}",
      physicalContingencyTotal: "${map['physicalContingencyTotal']}",
      priceContingencyTotal: "${map['priceContingencyTotal']}",
      grantTotal: "${map['grantTotal']}",
      projectManagement: "${map['projectManagement']}",
      getLogFrame: "${map['getLogFrame']}",
      view: "${map['view']}",
      print_r: "${map['print_r']}",
      key: "${map['key']}",
    );
  }

  String toJson() => json.encode(toMap());

  factory PDFParams.fromJson(String source) => PDFParams.fromMap(json.decode(source));
}
