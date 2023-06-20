class ButtonInfo {
  ButtonInfo({
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  ButtonInfo copyWith({
    String? title,
    String? imagePath,
  }) {
    return ButtonInfo(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
