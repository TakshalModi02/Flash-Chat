import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/constants.dart';
import 'package:flutterchat/screens/chat_screen.dart';
import '../rounded_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {

  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter Email")
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
                  text: 'Log In',
                  onPress: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    try{
                      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                      if(user!=null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    }catch(e){
                      print(e);
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  bgColor: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
