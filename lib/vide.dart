import 'package:flutter/material.dart';
import 'package:gege/enternum.dart';
import 'package:gege/otpenter.dart';
import 'package:gege/vide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class vide extends StatefulWidget {
  const vide({Key? key}) : super(key: key);

  @override
  State<vide> createState() => _videState();
}

class _videState extends State<vide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.account_box_rounded,
                color: Colors.blue),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // perform search
            },
          ),
        ],
        backgroundColor: Colors.blue.shade600,
        elevation: 4,
        title: const Text('Video Viewer'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
      ),
    );
  }
}
