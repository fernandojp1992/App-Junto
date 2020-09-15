import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'AprovadosModel.dart';
import 'package:http/http.dart' as http;





class Product{
  String email;
  Product({this.email});
  factory Product.fromJson(Map<String, dynamic> parsedJson){
    return Product(
      email: parsedJson['email'],
    );
  }
}

class Home extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;

  }

  Future<Aprovados> getAprovados(String idlan) async {

    final String apiUrl = "http://177.75.187.216/htdocs/arquivo.php";

    final response = await http.post(apiUrl, body:{
      "idlan" : idlan,
    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return aprovadosFromJson(responseString);
    }else{
      return null;
    }
  }
  Aprovados _aprovados;





  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var data = [0.0, 1.0, 1.5, 2.0, 0.0,0.0, -0.5, -1.0, -0.5, 0.0, 2.0];
    var datas = [0.0, 1.0, 1.5, 2.0, 0.0,1.0, -0.5, -1.0, -0.5, 0.0, 0.0];

    SnakeShape customSnakeShape = SnakeShape(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        centered: true);

    SnakeShape snakeShape = SnakeShape.circle;

    ShapeBorder customBottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    );

    ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    );

    ShapeBorder bottomBarShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)));

    int _selectedItemPosition = 1;
    SnakeBarStyle snakeBarStyle = SnakeBarStyle.floating;

    Color backgroundColor = Colors.white;
    Color selectionColor = Colors.black;

    EdgeInsets padding = EdgeInsets.all(12);
    Color containerColor = Color(0xFFFDE1D7);



    return Scaffold(

        bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Hexcolor('#150A4F'),
    ),
      child: SnakeNavigationBar(

        style: snakeBarStyle,
        snakeShape: snakeShape,
        snakeColor: selectionColor, //comment if you want to see colors
        backgroundColor: backgroundColor, //comment if you want to see colors
        shape: bottomBarShape,
        padding: padding,

        currentIndex: _selectedItemPosition,
        onPositionChanged: (index) =>
            setState(() => _selectedItemPosition = index),
        items: [

          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('calendar')),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('microphone')),
        ],
      ),
            ),


        body: Stack(

      children: <Widget>[

        StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("clientes").snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int i){

                var item = snapshot.data.docs[i].data();

                return ListTile(
                    title: Text(item['email']),

                );
              }
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }

      },
    ),


        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back-2.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Container(
          height: 200,

          decoration: BoxDecoration(

            borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0),
            ),
          ),


            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Juntotelecom.',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right:20, top:3),

                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),


                ],
              ),

            ),
          ),


        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 120),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Olá, Mauro!',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        ListView(
          padding: EdgeInsets.only(left: 20, top: 190, right: 20),
          children: <Widget>[

             InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/Receber");
              },
              child: Center(

                child: Container(

                  height: 300,
                  padding: EdgeInsets.only(
                    top: 10,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(5),
                      bottomRight: const Radius.circular(5),
                      topLeft: const Radius.circular(5),
                      topRight: const Radius.circular(5),
                    ),
                  ),
                    child: CustomScrollView(

                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(20.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              <Widget>[
                                Text("Contas a receber",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                              ),),),
                                Text("Total",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                 Text(
                                    'R\$ 7.000.000',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.green,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 28,
                                    ),),),
                                Sparkline(
                                    data: data,
                                  lineColor: Colors.green,
                                  pointsMode: PointsMode.all,
                                  pointSize: 8.0
                                )

                              ],
                            ),
                          ),
                        ),

                      ],

                    ),

                ),

              ),
            ),
            SizedBox(
                child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
            )),

            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/Pagar");
              },
              child: Center(
                child: Container(
                    height: 300,
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(5),
                        bottomRight: const Radius.circular(5),
                        topLeft: const Radius.circular(5),
                        topRight: const Radius.circular(5),
                      ),
                    ),
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(20.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              <Widget>[
                                Text("Contas a pagar",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 30,
                                    ),),),
                                Text("Total",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),),
                               StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection("lancamentosAberto").where("status", isEqualTo: "Analise").snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                                      if(snapshot.hasError){
                                        return Center(
                                          child: Text('Error ${snapshot.error}'),
                                        );
                                      }
                                      if(snapshot.connectionState == ConnectionState.waiting){
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }



                                      List<double> doubleList = [];
                                      double total = 0;
                                      snapshot.data.docs.forEach((item) {
                                        Map doc = item.data();
                                        doubleList.add(double.parse(doc['valorOriginal']));
                                      });
                                      total = doubleList.reduce((a, b) => a + b);
                                      return Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'R\$ ',
                                        )
                                            .format(double.parse(
                                            total.toString())),


                                        style: GoogleFonts.montserrat(
                                          color: Colors.red,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                        ),



                                      );
                                    }),

                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 28,
                                    ),),),
                                Sparkline(
                                    data: datas,
                                    lineColor: Colors.red,
                                    pointsMode: PointsMode.all,
                                    pointColor: Colors.grey,
                                    pointSize: 8.0
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),

          ],
        )
      ],

    )

    );

  }

}

  setState(int Function() param0) {}




