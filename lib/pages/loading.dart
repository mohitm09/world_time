import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    void setupWorldTime() async{
      WorldTime instance = WorldTime(location: data['location'], flag: data['flag'], url: data['url']);
      await Future.delayed(Duration(seconds: 3));
      await instance.getTime();
      Navigator.pushNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'dayTime': instance.dayTime
      });
    }

    setupWorldTime();

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
