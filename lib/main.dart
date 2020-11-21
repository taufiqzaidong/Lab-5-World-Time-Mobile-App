import 'package:flutter/material.dart';

import 'package:lab5_app/pages/choose_location.dart';
import 'package:lab5_app/pages/home.dart';
import 'package:lab5_app/pages/loading.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }));
