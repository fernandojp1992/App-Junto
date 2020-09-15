import 'dart:convert';
import 'dart:ffi';



import 'package:appjunto/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:video_player/video_player.dart';

import 'CPagarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';
import 'AprovadosModel.dart';


void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Junto Telecom',
      theme: ThemeData(),
      home: Splashscreen(),
      routes: <String, WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => new HomeScreen(),
        "/Profile": (BuildContext context) => new Profile(),
        "/Receber": (BuildContext context) => new Receber(),
        "/Pagar": (BuildContext context) => new Pagar(),
        "/Clientes": (BuildContext context) => new Clientes(),
        "/Home": (BuildContext context) => new Home(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/background.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    controller.setLooping(true);
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(

        body: Stack(
          children: <Widget>[

            VideoPlayer(controller),
            Container(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -200,
                    top: 150,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2.0)),
                          width: 400,
                          height: 400,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -250,
                    top: 100,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2.0)),
                          width: 500,
                          height: 500,
                        ),
                        Transform.translate(
                          offset:
                          Offset.fromDirection(getRadiansFromDegree(735), 470),
                          child: Row(
                            children: <Widget>[
                              CircularButton(
                                color: Colors.black,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  Navigator.of(context).pushNamed("/Receber");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Receber',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset:
                          Offset.fromDirection(getRadiansFromDegree(747), 527),
                          child: Row(
                            children: <Widget>[
                              CircularButton(
                                color: Colors.black,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  Navigator.of(context).pushNamed("/Pagar");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Pagar',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset:
                          Offset.fromDirection(getRadiansFromDegree(759), 557),
                          child: Row(
                            children: <Widget>[
                              CircularButton(
                                color: Colors.black,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.people,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  Navigator.of(context).pushNamed("/Clientes");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Clientes',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset:
                          Offset.fromDirection(getRadiansFromDegree(770), 560),
                          child: Row(
                            children: <Widget>[
                              CircularButton(
                                color: Colors.black,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.insert_chart,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  Navigator.of(context).pushNamed("/Home");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Gráficos',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset:
                          Offset.fromDirection(getRadiansFromDegree(725), 388),
                          child: Row(
                            children: <Widget>[
                              CircularButton(
                                color: Colors.black,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  Navigator.of(context).pushNamed("/Profile");
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Mauro',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class Profile extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back-2.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 75,
                        backgroundColor: Color(0xffffff),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/steve.jpg'),
                        ),
                      ),
                      Text(
                        'Mauro Collato',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        'mauro@juntotelecom.com.br',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 320),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      RaisedButton(
                        padding: const EdgeInsets.all(20),
                        onPressed: null,
                        child: Text('Notificações',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      SizedBox(height: 30),
                      RaisedButton(
                        padding: const EdgeInsets.all(20),
                        onPressed: null,
                        child: Text('Configurações',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      SizedBox(height: 30),
                      RaisedButton(
                        padding: const EdgeInsets.all(20),
                        onPressed: null,
                        child: Text('Sair',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class modelList { String idlan;
String dataVencimento;
String historico;
String nome;
String valorOriginal;

modelList({this.idlan, this.historico, this.nome, this.valorOriginal, this.dataVencimento});
}

class Pagar extends StatefulWidget {


  final String nome;

  Pagar({Key key,this.nome}) : super(key: key);



  @override
  _PagarState createState() => _PagarState();
}

class _PagarState extends State<Pagar> {

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



  bool isDesc = false;
  List<double> doubleList = [];
 var result;

 void sortDocs(){

      if (isDesc)
        doubleList.sort((a, b) => a.compareTo(b));
      else
        doubleList.sort((a, b) => b.compareTo(a));
      isDesc = !isDesc;

      print(doubleList);

  }

  List<DateTime> dateTimes = [];
  List filterListDateWeek (){

    for(var i = 0; i < dateTimes.length; i++){
      var dateDifference = DateTime.now().difference(
          dateTimes[i]);
      if(dateDifference.inDays > 0){
        if(dateDifference.inDays < 15){
          return dateTimes;

        }
      }
    }
  }

  @override

  void filterListDateDays (){

    if (isDesc)
      dateTimes.sort((a, b) => a.compareTo(b));
    else
      dateTimes.sort((a, b) => b.compareTo(a));
    isDesc = !isDesc;
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(

          children: <Widget>[


            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back-2.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),

            ),

            Padding(
              padding: EdgeInsets.only( top: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    padding: EdgeInsets.only(bottom:15),
                    color: Colors.transparent,
                    splashColor: Colors.black26,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Contas a pagar',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 110),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total:',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 130),

              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children:[
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
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

                            if (total == null){
                              return Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'R\$ ',
                                )
                                    .format(0
                                    ),
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }else {
                              return Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'R\$ ',
                                )
                                    .format(double.parse(
                                    total.toString())),
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }

                          }),
                    ),

                  ]
              ),
            ),
              Padding(
              padding: EdgeInsets.only(top: 210),

                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                children:[
                  FlatButton(
                    padding: EdgeInsets.only(bottom:15),
                    color: Colors.transparent,
                    splashColor: Colors.black26,
                    onPressed:() {

                          sortDocs();
                    },
                    child: Icon(Icons.format_list_numbered,
                      color: Colors.white,
                      size:30
                    ),
                  ),

                  FlatButton(
                    padding: EdgeInsets.only(bottom:14),
                    child: new Row(

                      children: <Widget>[
                        new Text('7 dias',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),

                        ],
                    ),
                    onPressed: () {
                      print(filterListDateWeek());
                    },


                  ),

                  FlatButton(
                    padding: EdgeInsets.only(bottom:14),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text('15 dias',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),

                      ],
                    ),
                    onPressed: () {
                    filterListDateDays();
                    },


                  ),


                  FlatButton(
                    padding: EdgeInsets.only(bottom:15),
                    color: Colors.transparent,
                    splashColor: Colors.black26,

                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Tem certeza que deseja aprovar todos os pagamentos?'),
                            content: Text(''),
                            actions: [
                              new FlatButton(
                                  child: const Text("Sim"),
                                  onPressed:  () async
                                  {


                                    FirebaseFirestore.instance
                                        .collection("lancamentosAberto")
                                        .where("status", isEqualTo: "Analise")
                                        .get()
                                        .then((res) {
                                      res.docs.forEach((result) {
                                        FirebaseFirestore.instance
                                            .collection("lancamentosAberto")
                                            .doc(result.id)
                                            .update({"status": "Aprovado"});
                                      });
                                    });


                                    Navigator.pop(context);
                                  }
                              ),
                              new FlatButton(
                                child: const Text("Cancel"),
                                onPressed: ()
                                {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )
                      );


                    },
                    child: Icon(Icons.check_circle_outline,
                        color: Colors.white,
                        size:30
                    ),
                  ),
                  ]
                )
              ),
            Padding(
              padding: EdgeInsets.only(top:270, left: 20, right: 20),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),

               child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("lancamentosAberto")
                        .where("status", isEqualTo: "Analise")
                        .snapshots(),
                    builder:
                        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error ${snapshot.error}'),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasData == null) {
                        return Center(
                          child: Text('Sem contas a pagar!'),
                        );
                      }


                      snapshot.data.docs.forEach((item) {
                        Map doc = item.data();
                        doubleList.add(double.parse(doc['valorOriginal']));

                      });


                      snapshot.data.docs.forEach((items) {
                        Map docc = items.data();
                        var splitted = docc['dataVencimento'].split('/');
                        var day = splitted[0];
                        var month = splitted[1];
                        var year = splitted[2];
                        var formatted = '$year-$month-$day';

                        dateTimes.add(DateTime.parse(formatted));
                      });

                      //dateTimes.sort((a, b) => b.compareTo(a));

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int i) {
                          var doc = snapshot.data.docs[i];
                          Map item = doc.data();

                          return ListTile(
                              leading:
                              Icon(Icons.attach_money, color: Colors.red, size: 30),
                              title: Text(
                                NumberFormat.currency(
                                    locale: 'id', symbol: 'R\$ ', decimalDigits: 0)
                                    .format(double.parse(doubleList[i].toString())),
                                style: GoogleFonts.montserrat(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle:
                              Text(item['nome'] + '\n' + dateTimes[i].toString() + '\n' + item['idlan']),
                              trailing: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text(
                                          'Tem certeza que deseja aprovar este pagamento?'),
                                      content: Text(''),
                                      actions: [
                                        new FlatButton(
                                            child: const Text("Sim"),
                                            onPressed: () async {
                                              final String idlan = item['idlan'];
                                              final Aprovados aprovados =
                                              await getAprovados(idlan);

                                              FirebaseFirestore.instance
                                                  .collection('historicoAprovados')
                                                  .add({
                                                'idlan': item['idlan'],
                                              });
                                              doc.reference
                                                  .update({'status': 'Aprovado'});

                                              Navigator.pop(context);
                                            }),
                                        new FlatButton(
                                          child: const Text("Cancel"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ));
                              });
                        },
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}

class Receber extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  Future<List<CPagarModel>> getCPagarModel() async {
    final url = "https://api.jsonbin.io/b/5f286d6d6f8e4e3faf2a382f/8";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonCPagar = jsonDecode(response.body);

      List<CPagarModel> cpagar = [];
      for (var u in jsonCPagar) {
        CPagarModel cpagarmodel = CPagarModel(
          u["NOME"],
          (u["VALORORIGINAL"]),
          u["DATAEMISSAO"],
          u["DATAVENCIMENTO"],
        );
        cpagar.add(cpagarmodel);
      }
      return cpagar;
    } else {
      throw Exception();
    }
  }

  DateFormat format = DateFormat("yyyy-MM-dd");



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back-2.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only( top: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    padding: EdgeInsets.only(bottom:15),
                    color: Colors.transparent,
                    splashColor: Colors.black26,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,
                    color: Colors.white,
                    ),
                  ),
                  Text(
                    'Contas a receber',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 130),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'R\$ 7.000.000',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 110),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total:',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 190, left: 20, right: 20),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),
                child: FutureBuilder(
                  future: getCPagarModel(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {

                          return ListTile(
                            leading: Icon(Icons.attach_money,
                                color: Colors.green, size: 30),
                            title: Text(
                              NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'R\$ ',
                                  decimalDigits: 0)
                                  .format(double.parse(
                                  snapshot.data[index].VALORORIGINAL)),
                              style: GoogleFonts.montserrat(
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                                '${snapshot.data[index].NOME} \n  ${snapshot.data[index].DATAEMISSAO} '),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    return CircularProgressIndicator(
                      strokeWidth: 10,
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

class Clientes extends StatelessWidget {
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295770513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back-2.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Clientes',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 130),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '75',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 110),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total:',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 190, left: 10, right: 10),
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                  ),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green, size: 30),
                      title: Text(
                        'A E M COBRANÇA MEDEIROS DE ANDRADE',
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('São Paulo - SP'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green, size: 30),
                      title: Text(
                        'ABIANCY CARDOSO ROSA SALAME - PERM JORNAL OPINIAO',
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('São Paulo - SP'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green, size: 30),
                      title: Text(
                        'ALAN RODRIGUES BARBOSA',
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('São Paulo - SP'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green, size: 30),
                      title: Text(
                        'A E M COBRANÇA MEDEIROS DE ANDRADE',
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('São Paulo - SP'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green, size: 30),
                      title: Text(
                        'ABIANCY CARDOSO ROSA SALAME - PERM JORNAL OPINIAO',
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('São Paulo - SP'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.green, size: 30),
                      title: Text(
                        'ALAN RODRIGUES BARBOSA',
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('São Paulo - SP'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/background.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    controller.setLooping(true);
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          VideoPlayer(controller),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Border border;
  final Decoration decoration;
  final Icon icon;
  final Function onClick;

  CircularButton({
    this.color,
    this.width,
    this.height,
    this.icon,
    this.onClick,
    this.border,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.0)),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: onClick,
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
