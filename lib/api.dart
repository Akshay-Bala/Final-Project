




import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:potholedetect/models/productModel.dart';

List<Products> products = [];

final dio = Dio();

Future<void> getHttp() async {
  try {
    final response = await dio.get('https://fakestoreapi.com/products');
    print(response);

    if (response.statusCode == 200) {
      // Parse the response body
      List<dynamic> responseData = response.data;
      
      // Convert each JSON object to a Product object
      products = responseData.map((e) => Products.fromJson(e)).toList();

      print('success');
      
    }
  } catch (e) {
    print('error $e');
  }
}

//get users



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: ()async{
            print('object');
           await getHttp();
            print(products.length);
          setState(() {
            
          });
          
          }, child: Text('get data')),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Text(products[index].category.toString());
          },
          itemCount: products.length,
          ))
        ],
      ),);
  }
}