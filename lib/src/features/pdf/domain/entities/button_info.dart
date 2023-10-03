class PDFButton {
  PDFButton({
    required this.name,
    required this.title,
    this.titleBn,
    required this.path,
  });

  final String name;
  final String title;
  final String? titleBn;

  /// path would be without the base url
  final String path;
}
