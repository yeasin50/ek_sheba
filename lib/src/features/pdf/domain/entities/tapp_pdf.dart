import 'button_info.dart';

enum _TappPDF {
  partA('${_baseUrl}get-tapp-report/part-a/'),
  partB('${_baseUrl}get-tapp-report/part-b/'),
  annexure1A('${_baseUrl}get-tapp-report/annexure-1a/'),
  annexure1B('${_baseUrl}get-tapp-report/annexure-1b/'),
  annexure2('${_baseUrl}get-tapp-report/annexure-2/'),
  annexure3('${_baseUrl}get-tapp-report/annexure-3/'),
  annexure4('${_baseUrl}get-tapp-report/annexure-4/'),
  annexure5('${_baseUrl}get-tapp-report/annexure-5/'),
  annexure6('${_baseUrl}get-tapp-report/annexure-6/'),
  annexure7('${_baseUrl}get-tapp-report/annexure-7/'),
  annexure8A('${_baseUrl}get-tapp-report/annexure-8a/'),
  annexure8B('${_baseUrl}get-tapp-report/annexure-8b/');

  const _TappPDF(this.path);

  final String path;
}

const String _baseUrl = 'https://gwtraining.plandiv.gov.bd/external/mobile-apps/';

List<PDFButton> tappButtons = [
  PDFButton(
    name: 'partA',
    title: 'Part-A (Project Summary)',
    titleBn: 'অংশ-ক (প্রকল্পের সার-সংক্ষেপ)',
    path: _TappPDF.partA.path,
  ),
  PDFButton(
    name: 'partB',
    title: 'Part-B (Project Details)',
    titleBn: 'অংশ-খ (প্রকল্পের বিস্তারিত বর্ণনা)',
    path: _TappPDF.partB.path,
  ),
  PDFButton(
    name: 'annexure1A',
    title: 'TAPP Annexure-1 (a) (Detailed Total Estimated Cost)',
    titleBn: 'সংযোজনী-১ (ক) (প্রাক্কলিত ব্যয়ের বিস্তারিত বিবরণী)',
    path: _TappPDF.annexure1A.path,
  ),
  PDFButton(
    name: 'annexure1B',
    title: 'TAPP Annexure-I (b) (Year Wise Breakdown of Component wise Estimated Cost)',
    titleBn: 'সংযোজনী-১ (খ) (প্রাক্কলিত ব্যয়ের বছরভিত্তিক বিস্তারিত বিবরণী)',
    path: _TappPDF.annexure1B.path,
  ),
  PDFButton(
    name: 'annexure2',
    title: 'TAPP Annexure-II (Terms of Reference)',
    titleBn: 'সংযোজনী-২ (Terms of Reference)',
    path: _TappPDF.annexure2.path,
  ),
  PDFButton(
    name: 'annexure3',
    title: 'TAPP Annexure-III (Consultants)',
    titleBn: 'সংযোজনী-৩ (Consultants)',
    path: _TappPDF.annexure3.path,
  ),
  PDFButton(
    name: 'annexure4',
    title: 'TAPP Annexure-IV (Implementation/Work Schedule)',
    titleBn: 'সংযোজনী-৪ (Implementation/Work Schedule)',
    path: _TappPDF.annexure4.path,
  ),
  PDFButton(
    name: 'annexure5',
    title: 'TAPP Annexure-VI (Tasks and Qualifications of Counterpart Personnel to be Attached with the Consultants)',
    titleBn: 'সংযোজনী-৫ (Tasks and Qualifications of Counterpart Personnel with the Consultants)',
    path: _TappPDF.annexure5.path,
  ),
  PDFButton(
    name: 'annexure6',
    title: 'TAPP Annexure-VI (Tasks and Qualifications of Support Staff to be Recruited)',
    titleBn: 'সংযোজনী-৬ (Tasks and Qualifications of Support Staff to be Recruited)',
    path: _TappPDF.annexure6.path,
  ),
  PDFButton(
    name: 'annexure7',
    title: 'TAPP Annexure-VII (Letter of Agreement with Development Partner(s))',
    titleBn: 'সংযোজনী-৭ (Letter of Agreement with Development Partner(s))',
    path: _TappPDF.annexure7.path,
  ),
  PDFButton(
    name: 'annexure8A',
    title: 'TAPP Annexure-VIII (a) GOODS',
    titleBn: 'সংযোজনী-৮ (ক) পন্য (উন্নয়ন প্রকল্পের জনবল কাঠামো)',
    path: _TappPDF.annexure8A.path,
  ),
  PDFButton(
    name: 'annexure8B',
    title: 'TAPP Annexure-VIII (b) SERVICES',
    titleBn: 'সংযোজনী-৮ (খ) সেবা (উন্নয়ন প্রকল্পের জনবল কাঠামো)',
    path: _TappPDF.annexure8B.path,
  ),
];
