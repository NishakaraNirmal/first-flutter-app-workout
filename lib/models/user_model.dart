// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:work_out_plan/data/equepment_data.dart';
import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/models/exercise_model.dart';

class User {
  final String userId;
  final String userName;
  final int userAge;
  final String gender;
  final String address;
  final String discription;
  int totalExerciseCompleted;
  int totalEquepmentHandOvered;

  final List<Exercise> exerciseList;
  final List<Equepment> equepmentList;

  final List<Exercise> favExerciseList;
  final List<Equepment> favEquepmentList;
  User({
    required this.userId,
    required this.userName,
    required this.userAge,
    required this.gender,
    required this.address,
    required this.discription,
    required this.totalExerciseCompleted,
    required this.totalEquepmentHandOvered,
    required this.exerciseList,
    required this.equepmentList,
    required this.favExerciseList,
    required this.favEquepmentList,
  });

  //user methods

  //add exercise to the exerciseList
  void addExercise(Exercise curExercise){
    exerciseList.add(curExercise);
  }

  void removeExercise(Exercise curExercise){
    exerciseList.remove(curExercise);
  }

  void addExerciseToFavourite(Exercise curExercise){
    favExerciseList.add(curExercise);
  }

   void removeExerciseToFavourite(Exercise curExercise){
    favExerciseList.remove(curExercise);
  }

    void addEquepment(Equepment curEquepment){
    equepmentList.add(curEquepment);
  }

  void removeEquepment(Equepment curEquepment){
    equepmentList.remove(curEquepment);
  }

  void addEquepmentToFavourite(Equepment curEquepment){
    favEquepmentList.add(curEquepment);
  }

   void removeEquepmentFromFavourite(Equepment curEquepment){
    favEquepmentList.remove(curEquepment);
  }

  int totalMinutes(){
    int totalMinutesSpend = 0;
    for(var exercise in exerciseList){
      totalMinutesSpend += exercise.exerciseMinutes;
    }
    for (var equipment in equepmentList){
      totalMinutesSpend += equipment.noOfMinutes;
    }

    return totalMinutesSpend;
  }

  void markAsDoneExercise(Exercise curDoneExercise){
    totalExerciseCompleted++;
    curDoneExercise.isCompleted = true;
    removeExercise(curDoneExercise);
  }

    void markAsDoneEquipment(Equepment curDoneEquipment){
    totalEquepmentHandOvered++;
    curDoneEquipment.handOvered = true;
    removeEquepment(curDoneEquipment);
  } 

  double totalCalryToBurn(){

    double totalCalory = 0.0;
    double allCalory = 0.0;
    //List<Equepment> curList = EquepmentData.equepmentDataList;
    final List<Equepment> ecuipmentData = EquepmentData().equepmentDataList;

    for (var Equepment in equepmentList){
      
      totalCalory+=Equepment.noOfCalories;
    }

    for (var curEquipment in ecuipmentData){
      allCalory+=curEquipment.noOfCalories;
    }

    return totalCalory/allCalory;
  }
}
