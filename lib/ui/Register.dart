import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping/ui/products.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          automaticallyImplyLeading: false,
          title:Text('Sign Up',style: TextStyle(color: Colors.white)),
        ),
        body: Center(
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
                  SizedBox(height: 23),
                  RaisedButton(
                    padding: EdgeInsets.only(left:60,right:60,top:20,bottom: 20),
                    elevation: 5,
                    color: Colors.orange.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () async{
                      if(_formKey.currentState.validate()){
                        try{
                          FirebaseAuth firebaseAuth=FirebaseAuth.instance;
                          var result= await firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);
                          User user=result.user;
                          if (result!=null){
                            FirebaseFirestore.instance.collection('users').doc().set(
                                {
                                  'email':user.email
                                });
                            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => Products()));
                          }
                        }
                        catch(e){
                          print(e.message);
                        }
                      }
                    },
                    child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
