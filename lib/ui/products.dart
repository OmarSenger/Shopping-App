import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/view.dart';
import 'login.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();
  var options = <String>['Settings','Logout'];


  void handleClick(String value) {
    setState(() {
      switch (value) {
        case 'Settings':
          break;
        case 'Logout':
          googleSignIn.signOut();
          facebookLogin.logOut();
          firebaseAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => LoginScreen()));
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Hand Bag',style: TextStyle(color: Colors.black))),
              Tab(child: Text('Glasses',style: TextStyle(color: Colors.black))),
              Tab(child: Text('Makeup',style: TextStyle(color: Colors.black))),
              Tab(child: Text('Jewellery',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold))),
            ],
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          bottomOpacity: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions : <Widget>[
            IconButton(
            icon:Icon(Icons.search,color:Colors.black), onPressed: () {},
            ),
            IconButton(
              icon:Icon(Icons.shopping_cart_outlined,color:Colors.black),
              onPressed: ()async {
              },
            ),
            PopupMenuButton<String>(
              onSelected: handleClick ,
              itemBuilder: (BuildContext context) {
                return options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,top:10),
                  child: Text('Products',style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                ),
                Column(
                  children: [
                    Container(
                      child: FittedBox(
                          fit: BoxFit.contain,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => ThirdRoute()),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Card(
                                      margin: EdgeInsets.only(left:10,top:10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.grey.withOpacity(0.9),
                                      child: Image.asset('images/1.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:50,top:5),
                                  child: Text('Black Hand Bag',style: TextStyle(fontSize: 15,color: Colors.grey)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 105,top:5),
                                  child: Text('200 LE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  onPressed: (){},
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Card(
                                      margin: EdgeInsets.only(left:10,top:10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.red.withOpacity(0.9),
                                      child: Image.asset('images/2.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:58,top:5),
                                  child: Text('Red Hand Bag',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 104,top:5),
                                  child: Text('120 LE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => ThirdRoute()),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Card(
                                      margin: EdgeInsets.only(left:10,top:10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.grey.withOpacity(0.9),
                                      child: Image.asset('images/1.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:50,top:5),
                                  child: Text('Black Hand Bag',style: TextStyle(fontSize: 15,color: Colors.grey)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 105,top:5),
                                  child: Text('200 LE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  onPressed: (){},
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Card(
                                      margin: EdgeInsets.only(left:10,top:10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.red.withOpacity(0.9),
                                      child: Image.asset('images/2.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:58,top:5),
                                  child: Text('Red Hand Bag',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 104,top:5),
                                  child: Text('120 LE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => ThirdRoute()),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Card(
                                      margin: EdgeInsets.only(left:10,top:10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.grey.withOpacity(0.9),
                                      child: Image.asset('images/1.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:50,top:5),
                                  child: Text('Black Hand Bag',style: TextStyle(fontSize: 15,color: Colors.grey)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 105,top:5),
                                  child: Text('200 LE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  onPressed: (){},
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Card(
                                      margin: EdgeInsets.only(left:10,top:10),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.red.withOpacity(0.9),
                                      child: Image.asset('images/2.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:58,top:5),
                                  child: Text('Red Hand Bag',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 104,top:5),
                                  child: Text('120 LE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
        ),
      ),
    );
  }
}
