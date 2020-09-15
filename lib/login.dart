import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/loginBack.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        child: Column(
          children: <Widget>[
            Align(
        alignment: Alignment.centerLeft,
          child: Container(
              padding: EdgeInsets.fromLTRB(30, 70, 0, 0),
              child: Text(
                'Bem',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              )
            ),
        ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    'Vindo.',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 140, 30, 0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        )
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'SENHA',
                          labelStyle: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(5),
                        shadowColor: Colors.lightBlueAccent,
                        color: Colors.blue,
                        elevation: 7,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed("/HomeScreen");
                          },
                          child: Center(
                            child: Text(
                              'Entrar',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        )
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
