import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_pk/itemPage.dart';

class ItemsWidget extends StatelessWidget {
 final List<String> ProductNAme=[
    'Bag',
   'HandBag',
   'Bag',
   'Sandal',
   'Sandal',
   'Watch', 'Watch',

  ];
 final List<String> ProductImages=[
   'images/1.jpg',
   'images/2.jpg',
   'images/3.jpg',
   'images/4.jpg',
   'images/5.jpg',
   'images/6.jpg',
   'images/7.jpg',

 ];
 final List<int> count=[
   1,2,3,4,5,6,7


 ];
 final List<String> ProductDetail=[
   "A product description is the marketing copy that explains what a product is and why it's worth purchasing.",
   "A product description is the marketing copy that explains what a product is and why it's worth purchasing.",
   "A product description is the marketing ",
   "A product description is the .",
   "A product description is the marketing copy that explains what a product is and why it's worth purchasing.",
  "A product description is the marketing copy that explains what a product is and why it's worth purchasing.",
   " product is and why it's worth purchasing.",
 ];
 final List<int> ProductPrice=[
   55,56,34,213,76,123,34

 ];
 ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 0.7,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i <7; i++)
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemPage(z: count[i],)));
            },
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '-50%',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ],
                  ),


                     Container(
                      margin: EdgeInsets.all(1),
                      child: Image.asset(ProductImages[i]),
                      height: 80,
                      width: 80,
                    ),

                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    alignment: Alignment.centerLeft,


                    child: Text(ProductNAme[i],style: TextStyle(fontSize: 20),),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50,

                    child: Text(ProductDetail[i]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),

                    child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text(ProductPrice[i].toString()),

                        Icon(

                          Icons.shopping_cart,
                          color: Color(0xFF4C53A5),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
