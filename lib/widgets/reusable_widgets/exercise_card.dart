import 'package:flutter/material.dart';
import 'package:work_out_plan/utils/colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String discription;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // ignore: deprecated_member_use
        color: kMainCardBgColor,
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 2))],
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.asset(
              imageUrl,
              width: 105,
              height: 105,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(discription, style: TextStyle(color: kMainColor)),
        ],
      ),
    );
  }
}
