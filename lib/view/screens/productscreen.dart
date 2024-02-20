import 'package:ecommerce_exam/utils/cartlist.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {

    var pro = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: 380,
            child: Image.asset(pro['img']),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('\$ ${pro['price']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),Spacer(),
                    Text('⭐ 5.0',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Text(pro['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),SizedBox(height: 10,),
                Text('Color Option',style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text(pro['description'],style: TextStyle(color: Colors.black54),),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    cart.add(pro);
                  },
                  child: Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
