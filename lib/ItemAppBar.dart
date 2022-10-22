import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_pk/database/cart-provide.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent.withOpacity(0.1),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 30,
            ),

          ),
          Padding(padding: EdgeInsets.only(left: 20),child: Text('Product',style: TextStyle(fontSize: 24),),),
          Spacer(),
          Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context,value,child){
                return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white)
                );},
            ),
            animationDuration: Duration(seconds: 5),
            child:Icon(Icons.shopping_cart),

          ),
        ],
      ),
    );
  }
}
