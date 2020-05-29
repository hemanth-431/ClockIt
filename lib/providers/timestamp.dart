import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:clockit/providers/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:clockit/providers/product.dart';
import 'auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeStamp with ChangeNotifier {

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    notifyListeners();

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

    final url =
        'https://voicesearch-22c28.firebaseio.com/timesStack/$userId.json?auth=$token';
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

