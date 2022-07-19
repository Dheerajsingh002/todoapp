import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class SignInWithGoogle extends StatefulWidget {
  const SignInWithGoogle({Key? key}) : super(key: key);

  @override
  State<SignInWithGoogle> createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
 googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var reslut = await googleSignIn.signIn();
      if (reslut == null) {
        return;
      }
      
      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);

    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('SignInWithGoogle',
              style: TextStyle(fontSize: 30)),
          flexibleSpace: GestureDetector(
            onTap: (){
              googleLogin();
            },
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.purple,Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)
              ),
            ),
          ),
          ),
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.white,
                      gradient: const LinearGradient(colors: [Colors.purple,Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft)
                    ),
                    
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Sign In with Google",
                  style: TextStyle(fontSize: 17,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ),);

    
  }
}