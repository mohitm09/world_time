import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String flag1 =(data['flag']);

    // set background
    String bgImage;
    Color bgColor;
    if (data['dayTime'] == 1) {
      bgImage = 'time1.jpg';
      bgColor = Colors.lightBlueAccent;
    }
    else if (data['dayTime'] == 2) {
      bgImage = 'time2.jpg';
      bgColor = Colors.lightBlueAccent;
    }
    else if (data['dayTime'] == 3) {
      bgImage = 'time3.jpg';
      bgColor = Colors.purple;
    }
    else if (data['dayTime'] == 4) {
      bgImage = 'time4.jpg';
      bgColor = Colors.indigo;
    }
    else if (data['dayTime'] == 5) {
      bgImage = 'time5.jpg';
      bgColor = Colors.deepPurple;
    }
    else {
      bgImage = 'time6.jpg';
      bgColor = Colors.purpleAccent;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 220.0, 0, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/$flag1'),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0
                    ),
                  ),
                  SizedBox(height: 50.0),
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
