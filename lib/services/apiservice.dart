import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: avoid_print

class ApiService {
  late List listResponses;

  Future<void> getData() async {
    var headers = {
      'Authorization':
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNzQ2N2FkNzFjZjQ0MDViMzJmNDk1MTIzNmFkOTlhMiIsInN1YiI6IjY1MjY4M2E2ZWE4NGM3MDBjYTBlOWM3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VFOAOgt88QL_M3zEq31KQRNjO5jUI8i0DYS2VBeE5Wo'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&api_key=d7467ad71cf4405b32f4951236ad99a2'));

    request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body[0]) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      // return getData();
      print(result);

      // List<dynamic> body = json.decode(response);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
