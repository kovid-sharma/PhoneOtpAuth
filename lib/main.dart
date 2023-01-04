import 'package:flutter/material.dart';
import 'package:gege/enternum.dart';
import 'package:gege/otpenter.dart';
import 'package:gege/vide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'enter',
    routes: {'enter': (context)=> enternum(), 'otp':(context)=> otpen(),
    'vide': (context)=>vide(),
    },
  ));
}

