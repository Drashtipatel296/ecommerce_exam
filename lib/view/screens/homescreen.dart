import 'package:ecommerce_exam/utils/productlist.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F1),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.person_2_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/cart');
                        },child: Icon(Icons.shopping_cart)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Row(
                    children: List.generate(productData.length,
                            (index) => InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/product',arguments: productData[index]);
                              },
                              child: product(
                                  name: productData[index]['name'],
                                  price: productData[index]['price'],
                                  img: productData[index]['img'],
                              ),
                            ),
                    ),
                  ),
                  Row(
                    children: List.generate(productData.length,
                          (index) => InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/product',arguments: productData2[index]);
                            },
                            child: product(
                                                    name: productData2[index]['name'],
                                                    price: productData2[index]['price'],
                                                    img: productData2[index]['img'],
                                                  ),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget product({required String name, required String price, required String img})
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7.5,vertical: 5),
    child: Container(
      height: 320,
      width: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 175,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(img),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12,vertical: 5),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          '\$ ${price}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.add,color: Colors.white,size: 30,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
