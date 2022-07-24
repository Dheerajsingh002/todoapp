import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
class Signinwithtwitter extends StatefulWidget {
  const Signinwithtwitter({Key? key}) : super(key: key);

  @override
  State<Signinwithtwitter> createState() => _SigninwithtwitterState();
}

class _SigninwithtwitterState extends State<Signinwithtwitter> {
  void _signInTwitter() async{
    var twitterLogin=TwitterLogin(consumerKey: "6GTr9JgunTXi8YbWvLvmkEkBd", consumerSecret:"nipgtXzRWwitytC1roJWxn5c1eR0Dj5M18eiu8CH9fw1GGhgZ1" );
    final TwitterLoginResult result=await twitterLogin.authorize();
    switch (result.status){
      case TwitterLoginStatus.loggedIn:
        var session=result.session;
           print(session.username);
          // _sendTokenAndSecretToServer(session.token,session.secret);
          break;      
      case TwitterLoginStatus.cancelledByUser:
      // _showCancelMessage();
      print("cancelled by user");
        // TODO: Handle this case.
        break;
      case TwitterLoginStatus.error:
      print(result.errorMessage);
      
        // TODO: Handle this case.
        break;
    }
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('SignInWithTwitter',
              style: TextStyle(fontSize: 25)),
              actions: [
                GestureDetector(
                  onTap: (){
                    // logout();
                  },
                  child: const Center(child: Text("Logout",style: TextStyle(color: Color.fromARGB(255, 14, 21, 169),fontSize: 20),),),),
                  IconButton(onPressed: (){
                    Share.share("https://play.google.com/store/apps/details?id=com.instructivetech.TODOAPP");

                  }, icon: const Icon(Icons.share_outlined))              ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.purple,Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft)
            ),
          ),
          ),
          body: Center(
            child: GestureDetector(
              onTap: (){
                // googleLogin();
                // twitterLogin();
                _signInTwitter();
              },
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
                    "Sign In with Twitter",
                    style: TextStyle(fontSize: 17,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
            ),
          ),);   
  }
}