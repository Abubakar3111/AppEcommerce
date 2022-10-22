
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_pk/ItemAppBar.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_pk/database/Cart_model.dart';
import 'package:shop_pk/database/cart-provide.dart';
import 'package:shop_pk/database/db_helper.dart';

class ItemPage extends StatelessWidget {
  int z;

  
   ItemPage({Key? key,required this.z}) : super(key: key);

  final List<String> ProductNAme=[
    'Bag',
    'Chair',
    'stick',
    'Sandal',
    'Chair',
    'stick', 'Sandal',

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
   List<Color> Clrs=[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
     Colors.pink,
     Colors.teal,

  ];



  @override
  Widget build(BuildContext context) {
    DBHelper? dbHelper=DBHelper();
    final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.orange.withOpacity(0.7),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              ProductImages[z-1],
              height: 240,
            ),
          ),
          Arc(

            edge: Edge.TOP,
            arcType: ArcType.CONVEX,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Text(
                            ProductNAme[z-1],
                            style: TextStyle(fontSize: 28),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 30,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (index) {},
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  '01',
                                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.add,
                                  size: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(padding: EdgeInsets.symmetric(vertical: 10),child: Text(ProductDetail[z-1],style: TextStyle(fontSize: 17),),))
             ,   Padding(padding: EdgeInsets.symmetric(vertical: 8),child: Row(
                      children: [
                        Text('Size:',style: TextStyle(fontSize: 15),),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            for (int i=7;i<13;i++)
                            Container(
                              margin: EdgeInsets.symmetric(horizontal:5 ),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20),

                              ),
                              child: Text('$i',style: TextStyle(fontSize: 15),),
                            )
                          ],
                        ),


                      ],

                    ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 9),child: Row(
                      children: [
                        Text('Size:',style: TextStyle(fontSize: 15),),
                        SizedBox(
                          width: 10,
                        ),


                           Row(

                            children: [
                              for (int i=1;i<6;i++)
                                Container(
                                 margin: EdgeInsets.symmetric(horizontal: 6),
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Clrs[i],
                                    borderRadius: BorderRadius.circular(20),


                                  ),

                                )
                            ],
                          ),



                      ],

                    ),


                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 9),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price:',style: TextStyle(fontSize: 25),),
                        Text(ProductPrice[z-1].toString(),style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){
                            dbHelper!.insert(
                                Cart(
                                    id: count[z-1],
                                    productId: count[z-1].toString(),
                                    ProductNAme: ProductNAme[z-1].toString(),
                                    initialPrice: ProductPrice[z-1],
                                    ProductPrice: ProductPrice[z-1],
                                    quantity: 1,
                                    ProductImages: ProductImages[z-1].toString())
                            ).then((value) {
                              cart.addTotalPrice(double.parse(ProductPrice[z-1].toString()));
                              cart.addCounter();
                              print(cart.getCounter().toString());
                            }).onError((error, stackTrace){
                              print(error.toString());
                            });

                          },
                          child: Container(
                            height: 70,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue,

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart,size: 40,color: Colors.white,),
                                Text('Add to Cart',style: TextStyle(fontSize: 20,color: Colors.white),)
                              ],
                            ),
                          ),
                        )






                      ],

                    ),


                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

