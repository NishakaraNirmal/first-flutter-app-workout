// ignore_for_file: public_member_api_docs, sort_constructors_first
class Equepment {
  final int equepmentId;
  final String equepmentName;
  final String equepmentDiscription;
  final String equepmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  bool handOvered;
  Equepment({
    required this.equepmentId,
    required this.equepmentName,
    required this.equepmentDiscription,
    required this.equepmentImageUrl,
    required this.noOfMinutes,
    required this.noOfCalories,
    required this.handOvered,
  });
}
