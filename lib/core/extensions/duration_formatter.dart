extension DurationFormatterExtension on Duration {
  String get mSS =>
      "$inMinutes:${inSeconds.remainder(60).abs().toString().padLeft(2, "0")}";
}
