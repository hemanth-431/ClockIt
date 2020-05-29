import 'dart:convert';
import 'dart:math';
import 'package:clockit/screens/loading.dart';
import 'package:http/http.dart' as http;
import 'package:clockit/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        prod.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${prod.quantity}x \$${prod.price}',

                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),

                      IconButton(
                        icon: Icon(_expanded ? Icons.remove_red_eye : Icons.remove_red_eye ),
                        onPressed: () async {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>LoadingState()),
                          );

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

                          String hours = DateFormat.H().format(now);
                          String minutes = DateFormat.m().format(now);
                          String seconds = DateFormat.s().format(now);


                          final birthday = DateTime(2000, 11, 17);
                          var formattedDate = "${now.day}-${now.month}-${now.year}";
                          int day=now.day;
                          int month=now.month;
                          int year=now.year;
                          //print(formattedDate.substring(0,2));
                         // print(formattedDate.substring(3,4));
                       //   print(formattedDate.substring(5,formattedDate.length));
                   //       final date2 = DateTime.now();
                    //      final difference = date2.difference(birthday).inDays;
                    /*      var time=DateTime.parse(datetime);
                          time = time.toLocal();
                          var newHour=5;
                          time = new DateTime(time.year, time.month, time.day, newHour, time.minute, time.second, time.millisecond, time.microsecond);


                     */


                          Fluttertoast.showToast(

                              msg: widget.order.id,
                              toastLength: Toast.LENGTH_LONG,

                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white
                          );

                   //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingState(value: hours)));

                        }


                        ,),

                    ],
                  ),
                )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}

