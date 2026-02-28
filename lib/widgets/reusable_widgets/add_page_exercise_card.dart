// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:work_out_plan/utils/colors.dart';

class AddPageExerciseCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int minuites;
  final bool isAdded;
  final bool isExerciseAddedToFavourite;
  final void Function() addOrRemove;
  final void Function() toggleFavouriteExercise;

  const AddPageExerciseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.minuites,
    required this.isAdded,
    required this.addOrRemove,
    required this.toggleFavouriteExercise, required this.isExerciseAddedToFavourite,
  });

  @override
  State<AddPageExerciseCard> createState() => _AddPageExerciseCardState();
}

class _AddPageExerciseCardState extends State<AddPageExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      width: 200,
      height: 225,
      decoration: BoxDecoration(
        color: kMainCardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 2),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(widget.title),
          Image.asset(
            widget.imageUrl,
            width: 100,
            fit: BoxFit.cover,
          ),
          Text("${widget.minuites} minutes"),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: kMainBlackColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.addOrRemove();
                      },
                      icon: widget.isAdded ? Icon(Icons.remove) : Icon(Icons.add),
                      color: kMainDarkBlueColor,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: kMainBlackColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.toggleFavouriteExercise();
                      },
                      icon: widget.isExerciseAddedToFavourite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border),
                      color: kMainPinkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
