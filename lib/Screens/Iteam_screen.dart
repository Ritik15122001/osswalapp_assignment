import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:osswalapp/Screens/CartScreen.dart';

import '../Widgets/product_images_slider.dart';

class IteamScreen extends StatelessWidget {
  const IteamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFD4ECF7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
              ),
             child: Stack(
               children: [
                 Center(
                   child: ProductImageSlider(),
                 ),
                 Padding(padding: EdgeInsets.only(left: 15,top: 20),
                 child: InkWell(
                   onTap: (){
                     Navigator.pop(context);
                   },
                   child: Icon(Icons.arrow_back_ios_new,size:25,),),
                 ),
               ],
             ),
            ),
            SizedBox(height:10,),
          Padding(padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Apple Watch Series 6",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating:3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,),
                          onRatingUpdate: (rating){}
                      ),
                      SizedBox(width: 5,),
                      Text("(450)"),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                    Text("\$140",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                      ),
                    SizedBox(width:5,),
                    Text("\$200",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                      ],
                  ),
                  Column(
                    children: [
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ,",style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                    ],
                  ),
                ],
              )
            ],
          ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width/5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white30,
                ),
                child: Center(
                  child:Icon(Icons.favorite_outline,
                  color: Colors.redAccent,
                    size: 30,
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
