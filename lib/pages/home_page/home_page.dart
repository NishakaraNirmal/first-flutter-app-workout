import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_out_plan/data/equepment_data.dart';
import 'package:work_out_plan/data/exercise_data.dart';
import 'package:work_out_plan/data/streaching_data.dart';
import 'package:work_out_plan/data/user_data.dart';
import 'package:work_out_plan/data/warm_up_data.dart';
import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/models/exercise_model.dart';
import 'package:work_out_plan/models/user_model.dart';
import 'package:work_out_plan/pages/equepment_page/equepment_page.dart';
import 'package:work_out_plan/pages/exercise_page/exercise_page.dart';
import 'package:work_out_plan/utils/colors.dart';
import 'package:work_out_plan/utils/responsive.dart';
import 'package:work_out_plan/widgets/progress_card.dart';
import 'package:work_out_plan/widgets/reusable_widgets/exercise_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //formatters for datetime
  final DateFormat formatter1 = DateFormat('EEEE , MMMM');
  final DateFormat formatter2 = DateFormat('dd');

  //userdata

  final User mainUser = user1;
  //exercisedata and equepment Data and warmup list and also streaching.
  final List<Exercise> exercideList_ = ExrciseData().exerciseData;
  final List<Equepment> equepmentList = EquepmentData().equepmentDataList;
  final List<Exercise> warmupList = WarmUpData().earmUpData;
  final List<Exercise> strachingList = StreachingData().streachingData;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String nowDate = formatter1.format(now);
    String nowDay = formatter2.format(now);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
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
                  user1.userName,
                  style: TextStyle(
                    color: kMainBlackColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ProgressCard(progress: mainUser.totalCalryToBurn(), total: 100),
                SizedBox(height: 20),
                Text(
                  "Today's Activity",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              pagetitle: "Warmups",
                              pageDiscription:
                                  "A warm-up is a preparatory routine of light activities, like gentle cardio and dynamic stretches, done before a main workout to gradually increase heart rate, blood flow, and muscle temperature, preparing the body for more intense exercise and reducing injury risk.",
                              exerciseList: warmupList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Warmup",
                        imageUrl: "assets/images/exercises/cobra.png",
                        discription: "See More...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquepmentPage(
                              equepementListData: equepmentList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Equipment",
                        imageUrl: "assets/images/equment/dumbbells2.png",
                        discription: "See More...",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              pagetitle: "Exercises",
                              pageDiscription:
                                  "Exercise is planned, structured physical activity (like walking, sports, or lifting) done to improve or maintain fitness, strength, and health, burning calories and boosting well-being",
                              exerciseList: exercideList_,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Exercise",
                        imageUrl: "assets/images/exercises/dragging.png",
                        discription: "See More...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              pagetitle: "Stretching",
                              pageDiscription:
                                  "Stretching is a physical exercise that lengthens muscles and tendons to improve flexibility, range of motion, and muscle tone, helping to prevent injury and reduce stiffness by extending them to their fullest length, either held (static) or through movement (dynamic).",
                              exerciseList: strachingList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Stretching",
                        imageUrl: "assets/images/exercises/yoga.png",
                        discription: "See More...",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
