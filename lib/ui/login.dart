import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/ui/products.dart';
import 'Register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isSigned = false ;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  User user ;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool _checked = false;
  String data ='';
  String nameKey = '';

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);
    return true;
  }

  signInWithGoogle() async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken);
    UserCredential authResult = await firebaseAuth.signInWithCredential(authCredential);
    setState(() {
      user = authResult.user;
      try {
        
      }catch(e){
        print(e.details);
      }
    });
  }

  Future _handleLogin ()async {
    FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
    switch (_result.status){
      case FacebookLoginStatus.cancelledByUser:
        print('cancel by user');
        break;
      case FacebookLoginStatus.error:
        print('error');
        break;
      case FacebookLoginStatus.loggedIn:
        await signInWithFacebook(_result);
        break;
    }
  }

  Future signInWithFacebook(FacebookLoginResult _result)async{
    FacebookAccessToken _accessToken = _result.accessToken;
    AuthCredential _authCredential = FacebookAuthProvider.credential(_accessToken.token);
    var facebookUser = await firebaseAuth.signInWithCredential(_authCredential);
    setState(() {
      user = facebookUser.user ;
      isSigned = true ;
    });
  }

  Future<void>signOutFB()async{
    setState(() {
      firebaseAuth.signOut().then((value){
        _facebookLogin.logOut();
        isSigned = false ;
   });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
            title:Text("Sign in",style: TextStyle(color: Colors.white),)
        ),
        body:Center(
          child: SingleChildScrollView(
            child: Form(
              key:_formKey,
              child: Column(
                children: [
                  //email
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      SizedBox(width: 25),
                      RaisedButton(
                        padding: EdgeInsets.only(left:60,right:60,top:20,bottom: 20),
                        elevation: 10,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState.validate()&&_checked==true){
                            var result = await firebaseAuth
                                .signInWithEmailAndPassword(email: emailController
                                .text, password: passController.text);
                            User user = result.user;
                            if (user != null) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Products()));
                            }
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('email', emailController.text);
                            prefs.setString('password', passController.text);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (BuildContext ctx) => Products()));
                          }else if(_formKey.currentState.validate()&&_checked==false){
                            var result = await firebaseAuth
                                .signInWithEmailAndPassword(email: emailController
                                .text, password: passController.text);
                            User user = result.user;
                            if (user != null) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Products()));
                            }
                          }
                        },
                        child: Text("Sign In",style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 25),
                      RaisedButton(
                        padding: EdgeInsets.only(left:60,right:60,top:20,bottom: 20),
                        elevation: 5,
                        color: Colors.orange.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Register()));
                        },
                        child: Text("Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  ),
                  SizedBox(height:15),
                  Row(
                    children:[
                      Checkbox(
                        value: _checked,
                        onChanged:(bool value){
                          setState(() {
                            _checked=value;
                          });
                        },
                      ),
                      Text('Remember Me'),
                      SizedBox(width: 110),
                      GestureDetector(
                          onTap: (){
                            print('forget');
                          },
                          child: Text('Forget your password ?',style: TextStyle(color:Colors.blue,decoration: TextDecoration.underline))),
                    ],
                  ),
                  SizedBox(height:10),
                  Divider(
                    color: Colors.black45,
                    endIndent: 30,
                    indent: 30,
                  ),
                  Text('OR',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black45)),
                  SizedBox(height:25),
                  GoogleSignInButton(
                      borderRadius: 20.0,
                      textStyle: TextStyle(fontSize: 19,color: Colors.black45),
                      onPressed: () async{
                        await signInWithGoogle();
                          Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => Products()));
                      }),
                  SizedBox(height:20),
                  RaisedButton(
                    padding: EdgeInsets.only(left:30,right:30,top:20,bottom: 20),
                    elevation: 5,
                    color: Colors.blue.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () async{
                      await _handleLogin();
                      Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => Products()));
                    },
                    child: Text("Sign in With Facebook", style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        )

    );
  }
}


