class AppDateFormatter {
  /// Returns the formatted date in the format dd/mm/yyyy
  static String? getFormattedDate(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }
}
