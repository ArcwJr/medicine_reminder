import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rive/rive.dart';
import 'package:firebase_core/firebase_core.dart';


class QrGen extends StatefulWidget {
  @override
  _QrGenState createState() => _QrGenState();
}

class _QrGenState extends State<QrGen> {


  String _fcmToken = null;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  void initState(){
    dataToken();
  }
  dataToken() async{
    // final _initialization = await Firebase.initializeApp();
    String result = await _fcm.getToken();
    setState(() {
      _fcmToken = result;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Name_text.png',fit: BoxFit.contain),
          Container(margin: EdgeInsets.only(left: 20.0,right: 20.0),
            padding: EdgeInsets.only(left: 20.0,right: 20.0),

          

            child: QrImage(data: _fcmToken,foregroundColor: Color(0xffBB86FC),backgroundColor: Colors.black,),

          ),
        ],
      ),

    );
  }
}
