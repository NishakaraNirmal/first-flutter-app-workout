import 'package:flutter/material.dart';
import 'package:work_out_plan/utils/colors.dart';

class ProgressCard extends StatefulWidget {
  final double progress; //must be 0-1
  final int total;
  const ProgressCard({super.key, required this.progress, required this.total});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progress * widget.total).toInt();
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [kMainLightBlueColor, kMainDarkBlueColor],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Proteins, Fats,water & \nCarbohydrates",
              style: TextStyle(
                color: kMainWhiteColor,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: widget.progress,
              valueColor: AlwaysStoppedAnimation<Color>(kMainWhiteColor),
              backgroundColor: kMainDarkBlueColor,
              borderRadius: BorderRadius.circular(15),
              minHeight: 15,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Done",
                      style: TextStyle(color: kMainWhiteColor, fontSize: 20),
                    ),
                    Text(
                      "$done",
                      style: TextStyle(color: kMainWhiteColor, fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(color: kMainWhiteColor, fontSize: 20),
                    ),
                    Text(
                      "${widget.total}",
                      style: TextStyle(color: kMainWhiteColor, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
