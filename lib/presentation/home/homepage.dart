import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:products_app/services/product_service/products.dart';
import 'package:provider/provider.dart';



class ProductScreen extends StatefulWidget {


  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              productProvider.sortProductsByPrice();
            },
          ),
        ],
      ),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return Card(
            shadowColor: Colors.grey.shade300,
            child: ListTile(
              leading:Image.network(product.image.toString()),
              title: Text(product.title.toString()),
              subtitle: Text('\$${product.price.toString()}'),
            ),
          );
        },
      ),
    );
  }
}
