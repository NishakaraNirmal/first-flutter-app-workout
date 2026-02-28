import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_out_plan/models/exercise_model.dart';
import 'package:work_out_plan/utils/colors.dart';
import 'package:work_out_plan/widgets/reusable_widgets/exercise_card.dart';

class ExercisePage extends StatefulWidget {
  final String pagetitle;
  final String pageDiscription;
  final List<Exercise> exerciseList;
  const ExercisePage({
    super.key,
    required this.pagetitle,
    required this.pageDiscription,
    required this.exerciseList,
  });

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final DateFormat formatter1 = DateFormat('EEEE , MMMM');
  final DateFormat formatter2 = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String nowDate = formatter1.format(now);
    String nowDay = formatter2.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$nowDate $nowDay",
              style: TextStyle(
                color: kSubtitleColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.pagetitle,
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 5),
              Text(
                widget.pageDiscription,
                style: TextStyle(
                  // ignore: deprecated_member_use
                  color: kTextColor.withOpacity(0.75),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.exerciseList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  //mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  Exercise currentObject = widget.exerciseList[index];
                  return ExerciseCard(
                    title: currentObject.exerciseName,
                    imageUrl: currentObject.exerciseImageUrl,
                    discription:
                        "${currentObject.exerciseMinutes} mins of work out",
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
