import 'package:flutter/material.dart';
import 'package:work_out_plan/utils/colors.dart';

class AddNewPageEquipmentCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int minutes;
  final double calories;
  final void Function() equepmenttoggle;
  final void Function() equepmentFavouritetoggle;
  final bool isAddedEqu;
  final bool isAddEquFav;

  const AddNewPageEquipmentCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.minutes,
    required this.calories,
    required this.equepmenttoggle,
    required this.equepmentFavouritetoggle,
    required this.isAddedEqu,
    required this.isAddEquFav,
  });

  @override
  State<AddNewPageEquipmentCard> createState() =>
      _AddNewPageEquipmentCardState();
}

class _AddNewPageEquipmentCardState extends State<AddNewPageEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(widget.imageUrl, width: 130, fit: BoxFit.cover),
                  Column(
                    children: [
                      Text(
                        "${widget.minutes} mins of workout",
                        style: TextStyle(color: kMainColor, fontSize: 15),
                      ),
                      Text(
                        "${widget.calories} Calories will burn",
                        style: TextStyle(color: kMainColor, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          widget.equepmenttoggle();
                        },
                        icon: widget.isAddedEqu
                            ? Icon(Icons.remove)
                            : Icon(Icons.add),
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
                          widget.equepmentFavouritetoggle();
                        },
                        icon: widget.isAddEquFav
                            ? Icon(Icons.favorite_rounded)
                            : Icon(Icons.favorite_border),
                        color: kMainPinkColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
