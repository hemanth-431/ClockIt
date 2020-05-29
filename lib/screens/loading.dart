
import 'dart:convert';

import 'package:clockit/providers/auth.dart';
import 'dart:math';
import 'package:clockit/providers/product.dart';
import 'package:clockit/providers/timestamp.dart';
import 'package:intl/intl.dart';
import 'package:clockit/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


/*final FirebaseApp app = await FirebaseApp.configure(
name: 'test',
options: const FirebaseOptions(
googleAppID: '1:79601577497:ios:5f2bcc6ba8cecddd',
gcmSenderID: '79601577497',
apiKey: 'AIzaSyArgmRGfB5kiQT6CunAOmKRVKEsxKmy6YI-G72PVU',
projectID: 'flutter-firestore',
),
);

  Future<void> loadFromFirebase() async {

  var options = new FirebaseOptions(
    googleAppID: "***",
    apiKey: "**",
    databaseURL: "**",
  );

  final FirebaseApp app = await FirebaseApp.configure(
      name: "name",
      options: options
  );

  var database = new FirebaseDatabase(app: app);
}



final FirebaseOptions options = const FirebaseOptions(
  googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
  gcmSenderID: '297855924061',
  apiKey: 'AIzaSyCAQ9J6aG_vKeFEesgEkXI3-4PqR0j8qqM',
);

 */


class LoadingState extends StatefulWidget {
 //final String value;
 // LoadingState(this.value);
  HomePage createState()=> HomePage();
}

class HomePage extends State<LoadingState>{
  bool toogleValue=false;
  bool isEnabled = true ;
  String hours='';


  enableButton(){

    setState(() {
      isEnabled = true;
    });
  }

  disableButton(){

    setState(() {
      isEnabled = false;
    });
  }






  @override
  Widget build(BuildContext context) {
 //   final timestamp = Provider.of<TimeStamp>(context, listen: false);
    return MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),

        home: new Scaffold(
            appBar: AppBar(
              title: Text("your task will be displayed here"),

            ),

           // body: Container(
               // child: Button()

         //   )

            body: Container(
              color: Colors.white,
              height: 600.0,
              alignment: Alignment.center,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[


                      new Text("Task",
                          style: new TextStyle(
                            fontSize: 40.0,
                            fontFamily: "Bauhaus 93",
                            color: Colors.orange[600],
                          )

                      )],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[


                      new Text("your task is to create task Particulates",
                          style: new TextStyle(
                            fontSize: 20.0,

                            fontFamily: 'Ariel',
                            color: Colors.black,
                          )

                      )],
                  ),
                  new Row(),

                  new Row(),
                  new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[

                        new Text("Task Status : ",style: new TextStyle(
                          fontSize: 20.0,

                          fontFamily: 'Comic Sans MS',
                          color: Colors.black,)),
                        new Text(" ACCEPTED",style: new TextStyle(
                          fontSize: 20.0,

                          fontFamily: 'Comic Sans MS',
                          color: Colors.green,))
                      ]),
                  new Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      new Text("Description : ",style: new TextStyle(
                          fontSize: 14.0,

                          fontFamily: 'Ariel',
                          color: Colors.red[600])),
                      new Text("task discriptions will be visible here",style: new TextStyle(
                          fontSize: 14.0,fontFamily:'Ariel',color:Colors.red[600])),



                      //${Var}
                    ],

                  ),

                  new Row(mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[

                        // new Padding( padding: EdgeInsets.fromLTRB(0, 50, 0, 0)
                        //     ),
                        new Text("Total time: ",style: new TextStyle(fontSize: 18.0,fontFamily: 'Comic Sans MS',color: Colors.black, ),
                        ),

                        new Text( "78",style: new TextStyle(
                          fontSize: 20.0,

                          fontFamily: 'Comic Sans MS',
                          color: Colors.green,))
                      ]),



                  Container(
                    height: 200.0,
                    width: 200.0,

                  ),




                  new Row(



                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

Button(),
                        RaisedButton(
                          onPressed: enableButton,
                          color: Colors.orange[150],
                          textColor: Colors.black,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('pause'),

                        ),

                      ]),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        RaisedButton(
                          onPressed: enableButton,
                          color: Colors.red,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('end task'),

                        ),
                      ]
                  )

                ],
              ),


            )


        )
    );
  }

/*
  @override
  Future<void> initState() async {
    final authData = Provider.of<Auth>(context, listen: false);

    super.initState();

    final response=await http.get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');//void getTime() async
    Map data=jsonDecode(response.body);
    //     print(data);
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    //   print(datetime);
    //  print(offset);
    ///create date time object
    DateTime now=DateTime.parse(datetime);
    now= now.add(Duration(hours:int.parse(offset) ));
    //     print(now);


    String  hours = DateFormat.H().format(now);

    String minutes = DateFormat.m().format(now);

    String total="$hours hrs $minutes min";

    String seconds = DateFormat.s().format(now);



    var formattedDate = "${now.day}-${now.month}-${now.year}";

    int day=now.day;


    int month = now.month;


    int year = now.year;
String a=authData.userId;
String b=authData.token;
    final url =
        'https://voicesearch-22c28.firebaseio.com/timesStack/$a.json?auth=$b';
    try {
      final response = await http.put(
        url,
        body: json.encode(
          total,
        ),
      );

    } catch (error) {

    }

  }
  */
}

class Button extends StatefulWidget {

  ButtonState createState() => ButtonState();

}

class ButtonState extends State<Button> {
  DatabaseReference itemref;

//Item item;
//List<Item> items=List();


  bool isEnabled = true;

  sampleFunction() {
    print("jdbfj");
  }

/*@override
  Future<void> initState() async {

    super.initState();
item=Item("","");

    final FirebaseApp app = await FirebaseApp.configure(
      name: "clockit",
      options: options,
    );

    final FirebaseDatabase database = FirebaseDatabase(app: app);
itemref=database.reference().child('items');


//itemref=FirebaseDatabase.instance.reference().child('items');



  }

 */
/*void handleSubmit(){
  item.title="dff";
  item.body="fnnv";
  final FormState form=formKey.currentState;
  if(form.validate()){
    form.save();
    form.reset();

    itemref.push().set(item.toJson());
  }
}

 */
  @override
  Widget build(BuildContext contet) {
    final authData = Provider.of<Auth>(context, listen: false);

    String a = authData.userId;
    String b = authData.token;

    return FlatButton(

      //  onPressed: isEnabled ? () => timeApi() : null,
      onPressed: () {
toggleFavoriteStatus();
        /*    final url =
            'https://voicesearch-22c28.firebaseio.com/timesStack/$a.json?auth=$b';
        try {
          final response =  http.put(
            url,
            body: json.encode(
              "ji",
            ),
          );


        } catch (error) {

        }

     */
        //  initState();
        //   timestamp.toggleFavoriteStatu(
        //     authData.token,
        //      authData.userId,
        //    );

      },
      color: Colors.green,

      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Text('Start'),


    );
    //  isEnabled=false;
  }


  Future<void> toggleFavoriteStatus() async {
    final authData = Provider.of<Auth>(context, listen: false);
    String a=authData.userId;
    String b=authData.token;
    final response = await http.get(
        'http://worldtimeapi.org/api/timezone/Asia/Kolkata'); //void getTime() async
    Map data = jsonDecode(response.body);
    //     print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //   print(datetime);
    //  print(offset);
    ///create date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //     print(now);


    String hours = DateFormat.H().format(now);

    String minutes = DateFormat.m().format(now);

    String total = "$hours hrs $minutes min";

    String seconds = DateFormat.s().format(now);


    var formattedDate = "${now.day}-${now.month}-${now.year}";

    int day = now.day;


    int month = now.month;


    int year = now.year;

    final url =
        'https://voicesearch-22c28.firebaseio.com/timesStack/$a.json?auth=$b';
    try {
      final response = await http.put(
        url,
        body: json.encode(
          total,
        ),
      );
    } catch (error) {

    }
  }


}
/*
  void timeApi() async {
    final response=await http.get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');//void getTime() async
    Map data=jsonDecode(response.body);
    //     print(data);
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    //   print(datetime);
    //  print(offset);
    ///create date time object
    DateTime now=DateTime.parse(datetime);
    now= now.add(Duration(hours:int.parse(offset) ));
    //     print(now);


     String  hours = DateFormat.H().format(now);

      String minutes = DateFormat.m().format(now);


      String seconds = DateFormat.s().format(now);



    var formattedDate = "${now.day}-${now.month}-${now.year}";

    int day=now.day;


      int month = now.month;


      int year = now.year;

print(hours);



    /* Provider.of<TimeStamp>(context, listen: false).addTime(
   hours,
     minutes,
    );







}
*/



class Item {
  String key;
  String title;
  String body;
  Item(this.title,this.body);
  Item.fromSnapshot(DataSnapshot snapshot):key = snapshot.key,
  title=snapshot.value["title"],
  body=snapshot.value["body"];

  toJson(){
    return{
      "title":title,
      "body":body,
    };
  }



}


 */
