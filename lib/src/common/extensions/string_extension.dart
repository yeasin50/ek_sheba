extension StringFormat on String {
  String get pdfName {
    return replaceAll("_", " ").replaceAll(".pdf", " ");
  }
}
