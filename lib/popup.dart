import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popup model',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(title: 'Popup model'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
Future<String> createAlertDialog(BuildContext context){

  TextEditingController customController = TextEditingController();

  return showDialog(context: context,builder:(context){
    return AlertDialog(
      title: Text("Bravo c'est créé"), 
      content: TextField(controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text("Valider"),
          onPressed: (){

            Navigator.of(context).pop(customController.text.toString());

          },
        )
      ],
    );
  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
 
        title: Text(widget.title),
      ),
      body: Builder(builder: (context){
        return Container( 
          child: Center(
            child: FlatButton(
              padding:EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
              color: Colors.deepOrange, 
              textColor: Colors.white,
              onPressed:(){
                createAlertDialog(context);
                },
              child: Text(
                'Alert',
                style: TextStyle (fontSize: 20.0),
              ),
            ),
          ),
        );
      })
    );
  }
}
