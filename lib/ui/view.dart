import 'package:flutter/material.dart';
import 'file:///C:/Users/lenovo/IdeaProjects/shopping/lib/ui/products.dart';

class ThirdRoute extends StatefulWidget {

  @override
  ThirdRouteState createState() => ThirdRouteState();


}
class ThirdRouteState extends State<ThirdRoute> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.9),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white),
          onPressed: ()async{
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Products()),
            );
          },
        ),
        actions : <Widget>[
          IconButton(
              icon:Icon(Icons.search,color:Colors.white),
            onPressed: (){},
          ),
          IconButton(
            icon:Icon(Icons.shopping_cart_outlined,color:Colors.white),
            onPressed: ()async {
            },
          ),
        ],
      ),
      body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
              ),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.55,top:MediaQuery.of(context).size.height*0.02),
                          child: Text('Women Hand Bags',style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 18)),
                        ),
                       Padding(
                         padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.35),
                         child: Text('Black Hand Bag',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                       ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.6,top:MediaQuery.of(context).size.height*0.09),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.16),
                          child: Text('Price',style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 18)),
                        ),
                        Text('200 LE',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(26),topRight: Radius.circular(26)),
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.33,left:MediaQuery.of(context).size.width*0.05),
              child: Text('Details',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.4,left:MediaQuery.of(context).size.width*0.05,right:MediaQuery.of(context).size.width*0.05),
              child: Text('GOOD QUALITY: The shoulder tote bags made of premium PU leather and polyester lining, very durable and fashionable.ALL-MATCH AND PRACTICAL: Simple styling and flower pendant deco make the satchel easy to match any kind of outfits. No matter you are a student or an office lady, it is very suitable for you to go shopping, working or daily use with this top handle satchel, never go out of style.MULTI POCKETS: The leather handbag contains 3 main pockets, 1 interior middle zipper pocket, 2 interior slip pockets and 1 exterior back zipper pocket comfortably holds iPhone, iPad, wallet, cosmetic, umbrella, books and so on.EASY TO CARRY: Its comfortable to carry with the detacable and adjustable shoulder strap, you can use the purse as an handbag, shoulder tote bag or crossbody bag.DIMENSIONS: Approx dimensions are 12.2"(L)x5.5"(W)x9.1"(H), it is the perfect size as a daily bag and qite roomy to make all your stuff can be well organized inside.',textAlign: TextAlign.justify,style: TextStyle(color: Colors.grey.shade600),),
            ),
            Align(
              alignment: Alignment.topRight,
                child: Container
                  (
                  height: height*0.4,
                    width: width*0.7,
                    child: Image.asset('images/1.png'),
                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1,top:MediaQuery.of(context).size.height*0.04),
                ),
            ),
          ],
      ),
    );
  }
}