import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data['isDaytime']);

    //setbackground image
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[100] : Colors.indigo[700];
    Color txtColor = data['isDaytime'] ? Colors.black : Colors.grey[300];
    print(bgImage);
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/$bgImage'),
                        fit: BoxFit.cover)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                    child: Column(children: [
                      FlatButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDaytime': result['isDaytime'],
                              'flag': result['flag']
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location, color: txtColor),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(color: txtColor),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['location'],
                            style: TextStyle(
                                fontSize: 38,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                color: txtColor),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        data['time'],
                        style: TextStyle(fontSize: 20, color: txtColor),
                      )
                    ])))));
  }
}
