import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/products.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool _checked = false;
  String data ='';
  String nameKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value){
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value){
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height:20),
                  RaisedButton(
                    padding: EdgeInsets.only(left:60,right:60,top:20,bottom: 20),
                    elevation: 10,
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () async{
                      if (_formKey.currentState.validate()&&_checked==true) {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('email', emailController.text);
                        prefs.setString('password', passController.text);
                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => Products()));
                      }else if(_formKey.currentState.validate()&&_checked==false){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext ctx) => Products()));
                      }
                  },
                    child: Text("Sign In",style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
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
                  )
                ],
              ),
            ),
          ),
        )

    );
  }
}

