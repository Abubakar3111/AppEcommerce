import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_pk/categoryease.dart';

import 'package:shop_pk/categorywidget.dart';
import 'package:shop_pk/homeappbar.dart';
import 'package:shop_pk/itemwidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            HomeAppBar(),
            Container(

              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 50,
                          width: 200,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Here.....',
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.search,
                          size: 27,
                       color: Color(0xFF4C53A5),
                        )
                      ],
                    ),
                  ),
                  Container(

                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Text('Categories',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5)),),
                  ),
                  //CategoryWidget(Txt:"Women_Fashion",name: "images/1.jpg"),
                  //CategoryWidget(Txt:"Women_Fashion",name: "images/.jpg"),
                  CategoryWidget(),




                  Container(

                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Text('Best Selling',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)
                    ),),
                  ),
                  ItemsWidget(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
animationCurve:Curves.easeOut ,
         backgroundColor: Colors.transparent,
            onTap: (index){},
            height: 70,
          color: Color(0xFF4C53A5),
            items: [

          Icon(CupertinoIcons.home,size: 40,color: Colors.white,),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'cartPage');
                  },
                  child: Icon(CupertinoIcons.cart_fill,size: 40,color: Colors.white,)),
          Icon(Icons.list,size: 40,color: Colors.white,),
        ]),
      ),
    );
  }
}
