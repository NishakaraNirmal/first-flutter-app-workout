import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/utils/colors.dart';
import 'package:work_out_plan/widgets/reusable_widgets/equepment_card.dart';

class EquepmentPage extends StatelessWidget {
  final List<Equepment> equepementListData;
  EquepmentPage({super.key, required this.equepementListData});

  final DateFormat formatter1 = DateFormat('EEEE , MMMM');
  final DateFormat formatter2 = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String Date = formatter1.format(now);
    String Day = formatter2.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$Date $Day",
              style: TextStyle(
                color: kSubtitleColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Equipment",
              style: TextStyle(
                color: kMainBlackColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Best Home Exercise Equipment for 2026 - CNETGym equipment includes cardio machines (treadmills, bikes, ellipticals) for heart health, strength machines (leg press, lat pulldown) for muscle building, and free weights (dumbbells, barbells, kettlebells) for versatile training, plus accessories like resistance bands and mats for flexibility and support, all designed to enhance physical fitness.",
                style: TextStyle(
                  // ignore: deprecated_member_use
                  color: kTextColor.withOpacity(0.75),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                ),
                itemCount: equepementListData.length,
                itemBuilder: (context, index) {
                  Equepment curObject = equepementListData[index];
                  return EquepmentCard(
                    title: curObject.equepmentName,
                    imageUrl: curObject.equepmentImageUrl,
                    minutes: curObject.noOfMinutes,
                    calories: curObject.noOfCalories,
                    discription: curObject.equepmentDiscription,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
