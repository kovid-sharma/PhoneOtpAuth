import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gege/enternum.dart';
class otpen extends StatefulWidget {
  const otpen({Key? key}) : super(key: key);

  @override
  State<otpen> createState() => _otpenState();
}

class _otpenState extends State<otpen> {
  final FirebaseAuth auth= FirebaseAuth.instance;
  var otpcame="";
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 47,
      height: 49,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.lightBlue.shade100,Colors.white70],
        )
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 4,
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.account_box_rounded),



        ),

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
       // alignment: Alignment,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/Blackcoffer-logo-new.png',
                width: 300,
                height: 300,
              ),
              Text('ENTER OTP:',
              textAlign: TextAlign.left,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                //backgroundColor: Colors.blue,
                fontSize: 22,
               fontFamily: 'Ubuntu',
                color: Colors.grey.shade700,
              ),),
              SizedBox(
                height:5,
              ),
          Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onChanged: (val){
              otpcame=val;
            },
          ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children :[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async{
                        await FirebaseAuth.instance.verifyPhoneNumber(

                          phoneNumber: '+91${enternum.texti.trim()}',
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

                  child: Text('Did not get Otp?  Resend?',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.red[300],
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.start,
                ),
                  )],
              ),
              SizedBox(
                height: 40,
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
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider
                            .credential(
                            verificationId: enternum.va, smsCode: otpcame);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Navigator.pushNamed(context, 'vide');
                      }
                      catch(e){
                        print("wrong otp");
                      }
                      //Navigator.pushNamed(context, 'otp');
                    },
                    child: Text("Get Started")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
