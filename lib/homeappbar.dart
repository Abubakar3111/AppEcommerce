import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:shop_pk/CartPage.dart';
import 'package:shop_pk/database/cart-provide.dart';
class HomeAppBar extends StatelessWidget {

   HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child:
      Row(
        children: [
          Icon(Icons.sort,size: 30,color: Color(0xFF4C53A5),),
        Padding(padding: EdgeInsets.only(left: 20),
        ),
          Text('Abubakar Shop',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5)),),
          Spacer(),
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            },
            child: Center(
              child: Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context,value,child){
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white)
                    );},
                ),
                animationDuration: Duration(seconds: 5),
                child:Icon(Icons.shopping_cart),

              ),
            ),
          ),
        ],

      ),
    );
  }
}
