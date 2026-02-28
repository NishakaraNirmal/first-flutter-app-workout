import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_out_plan/data/user_data.dart';
import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/models/exercise_model.dart';
import 'package:work_out_plan/models/user_model.dart';
import 'package:work_out_plan/utils/colors.dart';
import 'package:work_out_plan/widgets/reusable_widgets/favourite_page_card.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
                SizedBox(height: 15),
                Text(
                  "Here are all your favorited Workouts",
                  style: TextStyle(color: kMainColor, fontSize: 18),
                ),
                SizedBox(height: 15),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: mainUser1.favExerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise curFavExercise = mainUser1.favExerciseList[index];
                    return FavouritePageCard(
                      title: curFavExercise.exerciseName,
                      imageUrl: curFavExercise.exerciseImageUrl,
                    );
                  },
                ),
                SizedBox(height: 15),
                Text(
                  "Here are all your favorited Equipment",
                  style: TextStyle(color: kMainColor, fontSize: 18),
                ),
                SizedBox(height: 15),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: mainUser1.favEquepmentList.length,
                  itemBuilder: (context, index) {
                    Equepment curFavEquipment =
                        mainUser1.favEquepmentList[index];
                    return FavouritePageCard(
                      title: curFavEquipment.equepmentName,
                      imageUrl: curFavEquipment.equepmentImageUrl,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
