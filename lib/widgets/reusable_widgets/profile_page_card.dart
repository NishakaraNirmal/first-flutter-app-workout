import 'package:flutter/material.dart';
import 'package:work_out_plan/utils/colors.dart';

class ProfilePageCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final void Function() markAsDone;
  const ProfilePageCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.markAsDone,
  });

  @override
  State<ProfilePageCard> createState() => _ProfilePageCardState();
}

class _ProfilePageCardState extends State<ProfilePageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kMainCardBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Text(widget.title),
          SizedBox(width: 20),
          Image.asset(widget.imageUrl, width: 50),
          Spacer(),
          IconButton(
            onPressed: () {
              widget.markAsDone();
            },
            icon: Icon(Icons.check, color: kMainDarkBlueColor),
          ),
        ],
      ),
    );
  }
}
