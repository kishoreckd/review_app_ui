import 'package:flutter/material.dart';

class NewMoviesWidget extends StatefulWidget {
  const NewMoviesWidget({super.key});

  @override
  State<NewMoviesWidget> createState() => _NewMoviesWidgetState();
}

class _NewMoviesWidgetState extends State<NewMoviesWidget> {
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
                'New Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 1; i < 5; i++)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/moviePage');
                  },
                  child: Container(
                    width: 190,
                    height: 300,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Color(0XFF292B37),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF292B37),
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            'images/av$i.jpeg',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Movie Title',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Action/Adventure',
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      '9.2',
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 16),
                                    )
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
