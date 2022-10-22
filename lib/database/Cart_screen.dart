import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_pk/database/Cart_model.dart';
import 'package:shop_pk/database/cart-provide.dart';
import 'package:shop_pk/database/db_helper.dart';
class CartScreen extends StatefulWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper=DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("My Cart"),
        centerTitle: true,
        actions: [
          Center(
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

          SizedBox(width: 20,)
        ],

      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot){
                if(snapshot.hasData){
                  return Expanded(child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [

                                    Image(
                                        height: 100,width: 100,
                                        image: NetworkImage(snapshot.data![index].ProductImages.toString())
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                              Text(snapshot.data![index].ProductNAme.toString(),style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                            InkWell(
                                                onTap: (){
                                                  dbHelper!.delete(snapshot.data![index].id!);
                                                  cart.removerCounter();
                                                  cart.removeTotalPrice(double.parse(snapshot.data![index].ProductPrice.toString()));
                                                },
                                                child: Icon(Icons.delete,color: Colors.redAccent,size: 20,)),
                                          ],),

                                          SizedBox(height: 10,),
                                          Text(r"$" +snapshot.data![index].ProductPrice.toString(),style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          ), SizedBox(height: 10,),

                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(

                                                onTap: (){},
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      color: Colors.teal
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(onTap: (){
                                                          int quantity=snapshot.data![index].quantity!;
                                                          int price=snapshot.data![index].ProductPrice!;
                                                          quantity--;
                                                          int? newPrice=quantity*price;
                                                          if(quantity>0){

                                                            dbHelper!.update(Cart(
                                                              id: snapshot.data![index].id!,
                                                              productId: snapshot.data![index].id!.toString(),
                                                              ProductNAme: snapshot.data![index].ProductNAme!,
                                                              initialPrice:  snapshot.data![index].initialPrice!,
                                                              ProductPrice: newPrice,
                                                              quantity: quantity
                                                              ,
                                                              ProductImages: snapshot.data![index].ProductImages.toString(),
                                                            )).then((value){
                                                              newPrice=0;
                                                              quantity=0;
                                                              cart.removeTotalPrice(double.parse( snapshot.data![index].initialPrice!.toString()));
                                                            }).onError((error, stackTrace) {
                                                              print(error.toString());
                                                            });
                                                          }

                                                        },child: Icon(Icons.remove,color: Colors.white,)),
                                                        Text(snapshot.data![index].quantity.toString(),style: TextStyle(color: Colors.white),),
                                                        InkWell(onTap:(){
                                                          int quantity=snapshot.data![index].quantity!;
                                                          int price=snapshot.data![index].ProductPrice!;
                                                          quantity++;
                                                          int? newPrice=quantity*price;
                                                          dbHelper!.update(Cart(
                                                            id: snapshot.data![index].id!,
                                                            productId: snapshot.data![index].id!.toString(),
                                                            ProductNAme: snapshot.data![index].ProductNAme!,
                                                            initialPrice:  snapshot.data![index].initialPrice!,
                                                            ProductPrice: newPrice,
                                                            quantity: quantity
                                                            ,
                                                            ProductImages: snapshot.data![index].ProductImages.toString(),
                                                          )).then((value){
                                                            newPrice=0;
                                                            quantity=0;
                                                            cart.addTotalPrice(double.parse( snapshot.data![index].initialPrice!.toString()));
                                                          }).onError((error, stackTrace) {
                                                            print(error.toString());
                                                          });

                                                        },child: Icon(Icons.add,color: Colors.white,)),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ),
                                        ],),
                                    ),


                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),

                  );
                }
                return Text('data');

              }),
          Consumer<CartProvider>(builder: (context,value,child){
            return Column(
              children: [
                ReUsableWidget(title: "SubTOTAL",value: r"$"+value.getTotalPrice().toStringAsFixed(2),),

              ],
            ) ;

          }),
        ],
      ),
    );
  }
}
class ReUsableWidget extends StatelessWidget {
  final String title,value;
  ReUsableWidget({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 24,color: Colors.black)),
          Text(value.toString(),style: TextStyle(fontSize: 24,color: Colors.black))

        ],
      ),
    );
  }
}