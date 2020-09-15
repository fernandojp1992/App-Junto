
import 'package:appjunto/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if(status){
            _navigateToHome();
          }
        }
    );
  }
  Future<bool> _mockCheckForSession() async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen()
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.blue,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "JuntoTelecom ",
                    style: GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 63),
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.blue,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Conectando você ",
                      style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
