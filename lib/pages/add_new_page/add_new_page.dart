import 'package:flutter/material.dart';
import 'package:work_out_plan/data/equepment_data.dart';
import 'package:work_out_plan/data/exercise_data.dart';
import 'package:work_out_plan/data/user_data.dart';
import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/models/exercise_model.dart';
import 'package:work_out_plan/models/user_model.dart';
import 'package:work_out_plan/utils/colors.dart';
import 'package:work_out_plan/widgets/reusable_widgets/add_new_page_equipment_card.dart';
import 'package:work_out_plan/widgets/reusable_widgets/add_page_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final User curUser = user1;
  final List<Exercise> horizontalExerciseList = ExrciseData().exerciseData;
  final List<Equepment> vertivalEquepmentList =
      EquepmentData().equepmentDataList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello ${curUser.userName}",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                  "Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(color: kMainColor, fontSize: 17),
                ),
                SizedBox(height: 20),
                Text(
                  "All Exercises",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: horizontalExerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise curObject = horizontalExerciseList[index];
                      return AddPageExerciseCard(
                        title: curObject.exerciseName,
                        imageUrl: curObject.exerciseImageUrl,
                        minuites: curObject.exerciseMinutes,
                        isAdded: curUser.exerciseList.contains(curObject),
                        isExerciseAddedToFavourite: curUser.favExerciseList
                            .contains(curObject),
                        addOrRemove: () {
                          if (curUser.exerciseList.contains(curObject)) {
                            setState(() {
                              curUser.removeExercise(curObject);
                            });
                          } else {
                            setState(() {
                              curUser.addExercise(curObject);
                            });
                          }
                          //print(curUser.exerciseList);
                        },
                        toggleFavouriteExercise: () {
                          if (curUser.favExerciseList.contains(curObject)) {
                            setState(() {
                              curUser.removeExerciseToFavourite(curObject);
                            });
                          } else {
                            setState(() {
                              curUser.addExerciseToFavourite(curObject);
                            });
                          }

                          //print(curUser.favExerciseList);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "All Equipment",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 15),
                //equipment vertival list
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2.34,
                  ),
                  itemCount: vertivalEquepmentList.length,
                  itemBuilder: (context, index) {
                    Equepment curEquepment = vertivalEquepmentList[index];
                    return AddNewPageEquipmentCard(
                      isAddedEqu: curUser.equepmentList.contains(curEquepment),
                      isAddEquFav: curUser.favEquepmentList.contains(
                        curEquepment,
                      ),
                      title: curEquepment.equepmentName,
                      calories: curEquepment.noOfCalories,
                      imageUrl: curEquepment.equepmentImageUrl,
                      minutes: curEquepment.noOfMinutes,
                      equepmenttoggle: () {
                        if (curUser.equepmentList.contains(curEquepment)) {
                          setState(() {
                            curUser.removeEquepment(curEquepment);
                          });
                        } else {
                          setState(() {
                            curUser.addEquepment(curEquepment);
                          });
                        }
                      },
                      equepmentFavouritetoggle: () {
                        if (curUser.favEquepmentList.contains(curEquepment)) {
                          setState(() {
                            curUser.removeEquepmentFromFavourite(curEquepment);
                          });
                        } else {
                          setState(() {
                            curUser.addEquepmentToFavourite(curEquepment);
                          });
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
