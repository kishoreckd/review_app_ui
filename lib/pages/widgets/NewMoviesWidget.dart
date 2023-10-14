import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moviereview/pages/MovieDetail.dart';

class NewMoviesWidget extends StatefulWidget {
  const NewMoviesWidget({super.key});

  @override
  State<NewMoviesWidget> createState() => _NewMoviesWidgetState();
}

class _NewMoviesWidgetState extends State<NewMoviesWidget> {
  late List listResponses = [];

  void setUpData() async {
    var headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzQ2N2FkNzFjZjQ0MDViMzJmNDk1MTIzNmFkOTlhMiIsInN1YiI6IjY1MjY4M2E2ZWE4NGM3MDBjYTBlOWM3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VFOAOgt88QL_M3zEq31KQRNjO5jUI8i0DYS2VBeE5Wo'
    };
    var dio = Dio();
    var response = await dio.request(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=d7467ad71cf4405b32f4951236ad99a2',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      listResponses = response.data["results"];
      // print(listResponses);

      // print(json.encode(response.data));
    } else {
      // print(response.statusMessage);
    }
    // await instance.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpData();
  }

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
              for (int i = 0; i < listResponses.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetail(
                              list: listResponses[i],
                            )));
                    // Navigator.pushNamed(context, '/moviePage');
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
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original/${listResponses[i]['poster_path']}",
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
                                  listResponses[i]['original_title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  listResponses[i]['release_date'],
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
                                      listResponses[i]['vote_average']
                                          .toString(),
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


// else {
//             return Center(child: CircularProgressIndicator());
//           }