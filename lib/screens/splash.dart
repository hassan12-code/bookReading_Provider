import 'dart:convert';

import 'package:book_reading/models/last_point.dart';
import 'package:book_reading/models/user.dart';
import 'package:book_reading/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getUserData();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Home.routeName,
          arguments: HomeArgs(user: user, lastPoint: lastPoint));
    });
    super.initState();
  }

  late User user;
  LastPoint? lastPoint;

  Future<void> getUserData() async {
    final data = await rootBundle.loadString('assets/data/users.json');
    final Map<String, dynamic> rawData = jsonDecode(data);
    final userData = rawData["users"]["123456"];
    this.user = User.fromJson(userData);

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    final lastPointString = _prefs.getString("lastPoint");

    if (lastPointString != null) {
      final lastPointRaw = jsonDecode(lastPointString) as Map<String, dynamic>;

      this.lastPoint = LastPoint.fromJson(lastPointRaw);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEBEE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.bookReader,
              size: 120,
              color: Color(0xFFDEABA1),
            ),
            Text(
              'Book Reading',
              style: GoogleFonts.dancingScript(
                fontSize: 48,
                color: Color(0xFFDEABA1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
