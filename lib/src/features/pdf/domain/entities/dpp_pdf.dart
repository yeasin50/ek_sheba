import 'button_info.dart';

class _DppPDFPath {
  static const String baseUrl = 'https://gwtraining.plandiv.gov.bd/external/mobile-apps/';

  String get partA => '${baseUrl}get-dpp-report/part-a/';
  String get partB => '${baseUrl}get-dpp-report/part-b/';
  String get annexure1 => '${baseUrl}get-dpp-report/annexure-1/';
  String get annexure2 => '${baseUrl}get-dpp-report/annexure-2/';
  String get annexure3A => '${baseUrl}get-dpp-report/annexure-3a/';
  String get annexure3B => '${baseUrl}get-dpp-report/annexure-3b/';
  String get annexure3C => '${baseUrl}get-dpp-report/annexure-3c/';
  String get annexure4 => '${baseUrl}get-dpp-report/annexure-4/';
  String get annexure5A => '${baseUrl}get-dpp-report/annexure-5a/';
  String get annexure5B => '${baseUrl}get-dpp-report/annexure-5b/';
  String get annexure6 => '${baseUrl}get-dpp-report/annexure-6/';
  String get annexure7 => '${baseUrl}get-dpp-report/annexure-7/';
}

List<PDFButton> dppPdfButtons = [
  PDFButton(
    name: 'partA',
    title: "Part-A (Project Summary)",
    titleBn: 'অংশ-ক (প্রকল্পের সার-সংক্ষেপ)',
    path: _DppPDFPath().partA,
  ),
  PDFButton(
    name: 'partB',
    title: "Part-B (Project Details)",
    titleBn: 'অংশ-খ (প্রকল্পের বিস্তারিত বর্ণনা)',
    path: _DppPDFPath().partB,
  ),
  PDFButton(
    name: 'annexure1',
    title: 'Annexure-I (Location cost wise breakdown)',
    titleBn: 'সংযোজনী-১ (প্রকল্প এলাকাভিত্তিক ব্যয় বিভাজন)',
    path: _DppPDFPath().annexure1,
  ),
  PDFButton(
    name: 'annexure2',
    title: 'Annexure-II (Project management setup)',
    titleBn: 'সংযোজনী-২ (প্রকল্পের জনবল কাঠামো)',
    path: _DppPDFPath().annexure2,
  ),
  PDFButton(
    name: 'annexure3A',
    title: 'Annexure-III GOODS (Total Procurement Plan for development project/programme)',
    titleBn: 'সংযোজনী-৩ (ক) পন্য (উন্নয়ন প্রকল্প/কার্যক্রমের জন্য মোট ক্রয় পরিকল্পনা)',
    path: _DppPDFPath().annexure3A,
  ),
  PDFButton(
    name: 'annexure3B',
    title: 'Annexure-III WORKS (Total Procurement Plan for development project/programme)',
    titleBn: 'সংযোজনী-৩ (খ) পুর্ত কাজ (উন্নয়ন প্রকল্প/কার্যক্রমের জন্য মোট ক্রয় পরিকল্পনা)',
    path: _DppPDFPath().annexure3B,
  ),
  PDFButton(
    name: 'annexure3C',
    title: 'Annexure-III SERVICES (Total Procurement Plan for development project/programme)',
    titleBn: 'সংযোজনী-৩ (গ) সেবা (উন্নয়ন প্রকল্প/কার্যক্রমের জন্য মোট ক্রয় পরিকল্পনা)',
    path: _DppPDFPath().annexure3C,
  ),
  PDFButton(
    name: 'annexure4',
    title: 'Annexure-IV Year wise Financial and Physical Target Plan',
    titleBn: 'সংযোজনী-৪ (বছরভিত্তিক আর্থিক ও বাস্তব পরিকল্পনা)',
    path: _DppPDFPath().annexure4,
  ),
  PDFButton(
    name: 'annexure5A',
    title: 'Annexure-V (A) Detailed Cost Breakdown',
    titleBn: 'সংযোজনী-৫ (ক) (প্রাক্কলিত ব্যয়ের বিস্তারিত বিবরণী)',
    path: _DppPDFPath().annexure5A,
  ),
  PDFButton(
    name: 'annexure5B',
    title: 'Annexure-V (B) Detailed Annual Phasing of Cost',
    titleBn: 'সংযোজনী-৫ (খ) (প্রাক্কলিত ব্যয়ের বছরভিত্তিক বিস্তারিত বিবরণী)',
    path: _DppPDFPath().annexure5B,
  ),
  PDFButton(
    name: 'annexure6',
    title: 'Annexure-VI Amortization Schedule',
    titleBn: 'সংযোজনী-৬ (জিওবি গৃহীত ঋণ পরিশোধ সিডিউল)',
    path: _DppPDFPath().annexure6,
  ),
  PDFButton(
    name: 'annexure7',
    title: 'Annexure-VII (Medium Term Budget Framework)',
    titleBn: 'সংযোজনী-৭ (মধ্যমেয়াদি বাজেট কাঠামো)',
    path: _DppPDFPath().annexure7,
  ),
];
