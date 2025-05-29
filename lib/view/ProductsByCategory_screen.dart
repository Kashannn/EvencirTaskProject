import 'package:evencirtaskproject/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/product_model.dart';
import '../components/ProductCard.dart';
import '../components/SearchBar.dart';
import '../components/appBar.dart';
import '../core/services/GetData.dart';
import '../provider/ProductsProvider.dart';
class ProductsbycategoryScreen extends StatefulWidget {
  final String category;
  const ProductsbycategoryScreen({super.key, required this.category});

  @override
  State<ProductsbycategoryScreen> createState() => _ProductsbycategoryScreenState();
}

class _ProductsbycategoryScreenState extends State<ProductsbycategoryScreen> {
  @override
  void initState() {
    getProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.category,
        isBack: true,
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          CustomSearchBar(
            hintText: 'Search Products',
            onChanged: (value) {
              Provider.of<ProductsProvider>(context, listen: false)
                  .searchProducts(value);
            },
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text('${Provider.of<ProductsProvider>(context).filteredProducts.where((element) =>
            element.category!.toLowerCase() == widget.category.toLowerCase()).toList().length} '
                'Products Found',

                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],

                )),
          ),
          // Products List
          Expanded(
            child: Consumer<ProductsProvider>(
              builder: (context, provider, _) {
                // Get filtered products
                List<Product> filteredProducts = provider.filteredProducts.where((element) =>
                element.category!.toLowerCase() == widget.category.toLowerCase()).toList();
                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {
                        // Navigate to Product Detail Screen and pass the product data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              product: filteredProducts[index],
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        image: filteredProducts[index].thumbnail!,
                        name: filteredProducts[index].name!,
                        price: filteredProducts[index].price!.toDouble(),
                        brand: filteredProducts[index].brand!,
                        category: filteredProducts[index].category!,
                        rating: filteredProducts[index].rating!.toDouble(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
