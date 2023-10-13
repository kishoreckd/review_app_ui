import 'package:flutter/material.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Rated Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text('See All',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 1; i < 4; i++)
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'images/av$i.jpeg',
                      height: 180,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
