import 'package:flutter/material.dart';
import 'package:work_out_plan/utils/colors.dart';

class EquepmentCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int minutes;
  final double calories;
  final String discription;

  const EquepmentCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.minutes,
    required this.calories,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(imageUrl, width: 130,fit: BoxFit.cover,),
                  Column(
                    children: [
                      Text(
                        "$minutes mins of workout",
                        style: TextStyle(color: kMainColor, fontSize: 15),
                      ),
                      Text(
                        "$calories Calories will burn",
                        style: TextStyle(color: kMainColor, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              discription,
              style: TextStyle(color: kSubtitleColor),
            ),
          ],
        ),
      ),
    );
  }
}
