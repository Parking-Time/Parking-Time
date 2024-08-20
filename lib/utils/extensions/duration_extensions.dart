extension DurationExtensions on Duration {

  String toHHmm() {
    String hoursStr = inHours.toString().padLeft(2, '0');
    String minutesStr = inMinutes.remainder(60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr';
  }

}