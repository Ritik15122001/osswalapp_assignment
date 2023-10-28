import 'package:flutter/material.dart';
import '../Screens/Iteam_screen.dart';
class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    var pName =[
      "Apple Watch -M2",
      "White Tshirt",
      "Nike Shoe",
      "Ear Headphone",
      "Apple Watch -M2",
      "White Tshirt",
      "Nike Shoe",
      "Ear Headphone",
      "Apple Watch -M2",
      "White Tshirt",
      "Nike Shoe",
      "Ear Headphone",


    ];
    return GridView.builder(
        itemCount: pName.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
      ),
      itemBuilder: (context,index){
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFD4ECF7),
                boxShadow: [
                  BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),

                ]
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text("30% OFF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          ),
                        ),
                        Icon(Icons.favorite,color: Colors.redAccent,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(8),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>IteamScreen()));
                      },
                      child: Image.asset(
                        "images/${pName[index]}.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    ),
                    SizedBox(height: 5,),
                    Padding(padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pName[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height:5),
                          const Row(
                            children: [
                              Text(
                                "\$100",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          )
                        ],
                    ),
                    )
                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}
