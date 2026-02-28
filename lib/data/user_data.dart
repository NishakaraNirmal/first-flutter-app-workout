import 'package:work_out_plan/models/equment_model.dart';
import 'package:work_out_plan/models/exercise_model.dart';
import 'package:work_out_plan/models/user_model.dart';

User user1 = User(
  userId: "123456",
  userName: "John Doe",
  userAge: 30,
  gender: "Male",
  address: "123 Main St, City, Country",
  discription: "Fitness enthusiast",
  totalExerciseCompleted: 0,
  totalEquepmentHandOvered: 0,
  exerciseList: [
    Exercise(
      exerciseName: "Push-ups",
      exerciseImageUrl: "assets/images/exercises/cobra.png",
      exerciseMinutes: 15,
      exerciseId: 0,
      isCompleted: false,
    ),
  ],
  equepmentList: [
    Equepment(
      equepmentId: 0,
      equepmentName: "Dumbbells",
      equepmentDiscription:
          "A pair of dumbbells for strength training exercises.",
      equepmentImageUrl: "assets/images/equment/calendar.png",
      noOfMinutes: 30,
      noOfCalories: 2,
      handOvered: false,
    ),
  ],
  favExerciseList: [
    Exercise(
      exerciseName: "Squats",
      exerciseImageUrl: "assets/images/exercises/downward-facing.png",
      exerciseMinutes: 20,
      exerciseId: 1,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "Plank",
      exerciseImageUrl: "assets/images/exercises/dragging.png",
      exerciseMinutes: 30,
      exerciseId: 2,
      isCompleted: false,
    ),
  ],
  favEquepmentList: [
    Equepment(
      equepmentId: 1,
      equepmentName: "Resistance Bands",
      equepmentDiscription: "Elastic bands used for resistance exercises.",
      equepmentImageUrl: "assets/images/equment/checklist.png",
      noOfMinutes: 20,
      handOvered: false,
      noOfCalories: 15,
    ),
    Equepment(
      equepmentId: 2,
      equepmentName: "Yoga Mat",
      equepmentDiscription: "A mat for practicing yoga and floor exercises.",
      equepmentImageUrl: "assets/images/equment/dumbbell.png",
      noOfMinutes: 60,
      handOvered: false,
      noOfCalories: 30,
    ),
  ],
);
