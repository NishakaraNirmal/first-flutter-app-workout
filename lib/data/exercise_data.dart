import 'package:work_out_plan/models/exercise_model.dart';

class ExrciseData {
  final List<Exercise> exerciseData = [
    Exercise(
      exerciseName: "Push-ups",
      exerciseImageUrl: "assets/images/exercises/cobra.png",
      exerciseMinutes: 15,
      exerciseId: 0,
      isCompleted: false,
    ),
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
    Exercise(
      exerciseName: "Jumping Jacks",
      exerciseImageUrl: "assets/images/exercises/hunch_back.png",
      exerciseMinutes: 10,
      isCompleted: false,
      exerciseId: 3,
    ),
    Exercise(
      exerciseName: "Crunches",
      exerciseImageUrl: "assets/images/exercises/treadmill-machine_men.png",
      exerciseMinutes: 15,
      exerciseId: 4,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "Lunges",
      exerciseImageUrl: "assets/images/exercises/treadmill-machine_women.png",
      exerciseMinutes: 20,
      exerciseId: 5,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "Burpees",
      exerciseImageUrl: "assets/images/exercises/triangle.png",
      exerciseMinutes: 25,
      exerciseId: 6,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "High Knees",
      exerciseImageUrl: "assets/images/exercises/weightlifting.png",
      exerciseMinutes: 10,
      exerciseId: 7,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "Bicycle Crunches",
      exerciseImageUrl: "assets/images/exercises/yoga.png",
      exerciseMinutes: 20,
      exerciseId: 8,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "Leg Raises",
      exerciseImageUrl: "assets/images/exercises/triangle.png",
      exerciseMinutes: 15,
      exerciseId: 9,
      isCompleted: false,
    ),
  ];
}
