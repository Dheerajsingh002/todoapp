import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/SignInWithGoogle.dart';

void main() async{
  
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  theme:ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 82, 73, 73),
    // scaffoldBackgroundColor: Colors.black,
    
        primaryColor: const Color(0xff145C9E),),
  home:const SignInWithGoogle()));
}
