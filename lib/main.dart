import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/screens/welcome_screen.dart';
import 'package:flutterchat/screens/login_screen.dart';
import 'package:flutterchat/screens/registration_screen.dart';
import 'package:flutterchat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        ChatScreen.id : (context)=> ChatScreen(),
        LoginScreen.id: (context)=> LoginScreen(),
        RegistrationScreen.id: (context)=> const RegistrationScreen(),
        WelcomeScreen.id: (context)=>WelcomeScreen(),
      },
    );
  }
}
