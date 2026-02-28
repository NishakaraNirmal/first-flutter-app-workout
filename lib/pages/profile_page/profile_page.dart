import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_out_plan/data/user_data.dart';
import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/models/exercise_model.dart';
import 'package:work_out_plan/models/user_model.dart';
import 'package:work_out_plan/utils/colors.dart';
import 'package:work_out_plan/widgets/progress_card.dart';
import 'package:work_out_plan/widgets/reusable_widgets/profile_page_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DateFormat dateformat = DateFormat("EEEE , MMMM");
  final DateFormat dayFormat = DateFormat("dd");

  final User mainUser1 = user1;

  @override
  Widget build(BuildContext context) {
    DateTime nowTime = DateTime.now();
    String Date = dateformat.format(nowTime);
    String Day = dayFormat.format(nowTime);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                  user1.userName,
                  style: TextStyle(
                    color: kMainBlackColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ProgressCard(
                  progress: mainUser1.totalCalryToBurn(),
                  total: 100,
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kMainCardBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes To Spend: ${mainUser1.totalMinutes()}",
                          style: TextStyle(
                            color: kMainDarkBlueColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Total Exercise Completed: ${mainUser1.totalExerciseCompleted}",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Total Equipement HandOvered: ${mainUser1.totalEquepmentHandOvered}",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your Exercises",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black26, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 175,
                    child: ListView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: mainUser1.exerciseList.length,
                      itemBuilder: (context, index) {
                        Exercise curUserExercise =
                            mainUser1.exerciseList[index];
                        return ProfilePageCard(
                          imageUrl: curUserExercise.exerciseImageUrl,
                          title: curUserExercise.exerciseName,
                          markAsDone: () {
                            setState(() {
                              mainUser1.markAsDoneExercise(curUserExercise);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your Equipment",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black26, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 175,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mainUser1.equepmentList.length,
                      itemBuilder: (context, index) {
                        Equepment curUserEquipment =
                            mainUser1.equepmentList[index];
                        return ProfilePageCard(
                          imageUrl: curUserEquipment.equepmentImageUrl,
                          title: curUserEquipment.equepmentName,
                          markAsDone: () {
                            setState(() {
                              mainUser1.markAsDoneEquipment(curUserEquipment);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
