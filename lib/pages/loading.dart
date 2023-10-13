import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moviereview/services/apiservice.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpData() async {
    ApiService().getData();
    // await instance.getData();
    Navigator.pushNamed(
      context,
      '/home',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
