import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class enternum extends StatefulWidget {
  const enternum({Key? key}) : super(key: key);
  static String va="";
  static String texti='';
  @override
  State<enternum> createState() => _enternumState();
}

class _enternumState extends State<enternum> {
  final countryPicker = const FlCountryCodePicker(
    showDialCode: false,
    showSearchBar: true,
  );
  CountryCode? countryCode;
  String textin='+91';
  /*@override
  void initState(){
    countryCode?.flagImage;
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Blackcoffer-logo-new.png',
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: GestureDetector(
                        onTap: () async {
                          final code = await countryPicker.showPicker(context: context);
                          setState(() {
                            countryCode=code;
                            //code!=null?textin=code.dialCode:textin='';
                          });
                        },
                        child: Row(
                        children: [
                          Container(
                            child: countryCode!=null ? countryCode!.flagImage:null,
                          ),

                          Container(

                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 6,
                          ),

                          //margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                              countryCode!=null ? countryCode!.dialCode:'+91',
                            //'+91',
                             // style: const TextStyle(color: Colors.grey)
                      ),
                    ),
                        Text('|',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34,color:Colors.grey.shade700)),
                        ]
                    ),
                      ),),
                    Expanded(
                        child: TextField(
                          showCursor: true,
                          onChanged: (num){
                            textin=num;
                            enternum.texti=num;
                          },
                          //maxLength: 10,
                          //scrollPadding: EdgeInsets.symmetric(horizontal: 30),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                            suffixStyle: TextStyle(
                              color: Colors.grey[900],
                            ),
                            hintText: "Enter Mobile Number",
                          ),
                        )),
                    
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async{

                      await FirebaseAuth.instance.verifyPhoneNumber(

                        phoneNumber: '+91${textin.trim()}',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          enternum.va=verificationId;
                          Navigator.pushNamed(context, 'otp');
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      //
                    },
                    child: Text("Next")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

