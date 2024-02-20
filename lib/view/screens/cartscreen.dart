import 'package:ecommerce_exam/utils/cartlist.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cart) {
      double price = double.parse(item['price']);
      total += (item['quantity'] * price);
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(cart.length,
                          (index) => Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    height: 150,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              spreadRadius: 0.5,
                                              color: Colors.black12,
                                              offset: Offset(0, 5)
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18),
                                          child: Container(
                                            height: 100,
                                            width: 120,
                                            child: Image.asset(cart[index]['img']),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(cart[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                              Text('\$ ${cart[index]['price']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          cart[index]['quantity']--;
                                                        });
                                                      }, icon: Icon(Icons.remove)),
                                                  Text(cart[index]['quantity'],style: TextStyle(fontSize: 20),),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          '${cart[index]['quantity']}';
                                                        });
                                                      }, icon: Icon(Icons.add)),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          cart.removeAt(index);
                                                        });
                                                      }, icon: Icon(Icons.delete)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              )
            ),
            Container(
              height: 290,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      spreadRadius: 5,
                      color: Colors.black12,
                      offset: Offset(0, 5)
                  )
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                    child: Row(
                      children: [
                        Text('Total',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),Spacer(),
                        Text('\$95',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(thickness: 1,color: Colors.black,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Row(
                      children: [
                        Text('Sub Total',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),Spacer(),
                        Text('\$95',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text('Checkout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
