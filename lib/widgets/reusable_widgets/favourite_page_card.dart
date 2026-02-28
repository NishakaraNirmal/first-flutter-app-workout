import 'package:flutter/material.dart';
import 'package:work_out_plan/utils/colors.dart';

class FavouritePageCard extends StatelessWidget {

  final String title;
  final String imageUrl;

  const FavouritePageCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.45,
      //height: 100,
      decoration: BoxDecoration(
        color: kMainCardBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
          ),
          SizedBox(height: 5,),
          Image.asset(imageUrl,width: 90,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.favorite,color: kMainPinkColor,),
            ],
          )
        ],
      ),
    );
  }
}