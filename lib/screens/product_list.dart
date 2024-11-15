import 'package:flutter/material.dart';
import 'package:jokes_come_true/models/product.dart';
import 'package:jokes_come_true/widgets/left_drawer.dart';
import 'package:jokes_come_true/screens/product_details.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listMood = [];
    for (var d in data) {
      if (d != null) {
        listMood.add(Product.fromJson(d));
      }
    }
    return listMood;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Sorry, no products available yet!',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.price} Jade Feathers"),
                          const SizedBox(height: 10),
                          Text("Description: ${snapshot.data![index].fields.description.toString().trim()}"),
                          const SizedBox(height: 10),
                          Text("Qty: ${snapshot.data![index].fields.quantity}")
                        ],
                      )
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}