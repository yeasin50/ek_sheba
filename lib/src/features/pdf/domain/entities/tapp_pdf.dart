import 'button_info.dart';

enum _TappPDF {
  partA('get-tapp-report/part-a/'),
  partB('get-tapp-report/part-b/'),
  annexure1A('get-tapp-report/annexure-1a/'),
  annexure1B('get-tapp-report/annexure-1b/'),
  annexure2('get-tapp-report/annexure-2/'),
  annexure3('get-tapp-report/annexure-3/'),
  annexure4('get-tapp-report/annexure-4/'),
  annexure5('get-tapp-report/annexure-5/'),
  annexure6('get-tapp-report/annexure-6/'),
  annexure7('get-tapp-report/annexure-7/'),
  annexure8A('get-tapp-report/annexure-8a/'),
  annexure8B('get-tapp-report/annexure-8b/');

  const _TappPDF(this.path);

  final String path;
}

List<PDFButton> tappButtons = [
  PDFButton(
    name: 'partA',
    title: 'অংশ-ক (প্রকল্পের সার-সংক্ষেপ)',
    path: _TappPDF.partA.path,
  ),
  PDFButton(
    name: 'partB',
    title: 'অংশ-খ (প্রকল্পের বিস্তারিত বর্ণনা)',
    path: _TappPDF.partB.path,
  ),
  PDFButton(
    name: 'annexure1A',
    title: 'সংযোজনী-১ (ক) (প্রাক্কলিত ব্যয়ের বিস্তারিত বিবরণী)',
    path: _TappPDF.annexure1A.path,
  ),
  PDFButton(
    name: 'annexure1B',
    title: 'সংযোজনী-১ (খ) (প্রাক্কলিত ব্যয়ের বছরভিত্তিক বিস্তারিত বিবরণী)',
    path: _TappPDF.annexure1B.path,
  ),
  PDFButton(
    name: 'annexure2',
    title: 'সংযোজনী-২ (Terms of Reference)',
    path: _TappPDF.annexure2.path,
  ),
  PDFButton(
    name: 'annexure3',
    title: 'সংযোজনী-৩ (Consultants)',
    path: _TappPDF.annexure3.path,
  ),
  PDFButton(
    name: 'annexure4',
    title: 'সংযোজনী-৪ (Implementation/Work Schedule)',
    path: _TappPDF.annexure4.path,
  ),
  PDFButton(
    name: 'annexure5',
    title: 'সংযোজনী-৫ (Tasks and Qualifications of Counterpart Personnel with the Consultants)',
    path: _TappPDF.annexure5.path,
  ),
  PDFButton(
    name: 'annexure6',
    title: 'সংযোজনী-৬ (Tasks and Qualifications of Support Staff to be Recruited)',
    path: _TappPDF.annexure6.path,
  ),
  PDFButton(
    name: 'annexure7',
    title: 'সংযোজনী-৭ (Letter of Agreement with Development Partner(s))',
    path: _TappPDF.annexure7.path,
  ),
  PDFButton(
    name: 'annexure8A',
    title: 'সংযোজনী-৮ (ক) পন্য (উন্নয়ন প্রকল্পের জনবল কাঠামো)',
    path: _TappPDF.annexure8A.path,
  ),
  PDFButton(
    name: 'annexure8B',
    title: 'সংযোজনী-৮ (খ) সেবা (উন্নয়ন প্রকল্পের জনবল কাঠামো)',
    path: _TappPDF.annexure8B.path,
  ),
];
