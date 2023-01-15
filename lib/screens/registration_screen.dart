import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../rounded_button.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {

  static String id = 'RegistrationScreen';

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter Email"),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter Password"),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              child: _isLoading?Center(
                  child:  LoadingAnimationWidget.discreteCircle(
                    color: Colors.blueAccent,
                    secondRingColor: Colors.white,
                    thirdRingColor: Colors.blueAccent,
                    size: 30,
                  )):
              RoundedButton(
                  text: "Register",
                  onPress: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Firebase.initializeApp();
                    try{
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser!=null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    }catch(e){
                      print(e);
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  bgColor: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
