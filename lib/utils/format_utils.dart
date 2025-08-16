class FormatUtils {
  static String formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return "$minutes분 $seconds초";
  }

  static String formatPace(double paceSecondsPerKm) {
    if (paceSecondsPerKm == 0) return "0분 0초";
    int minutes = (paceSecondsPerKm / 60).floor();
    int seconds = (paceSecondsPerKm % 60).round();
    return "$minutes분 $seconds초";
  }

  static String formatDistance(double distanceInKm) {
    return "${distanceInKm.toStringAsFixed(2)}km";
  }

  static String formatDateTime(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
