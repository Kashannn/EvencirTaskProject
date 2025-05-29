import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/CategoryCard.dart';
import '../components/SearchBar.dart';
import '../components/appBar.dart';
import '../core/services/GetData.dart';
import '../provider/CategoryProvider.dart';
import 'ProductsByCategory_screen.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<String>> _categoriesFuture;
  @override
  void initState() {
    super.initState();
    _categoriesFuture = getCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              hintText: 'Search categories',
              onChanged: (value) {
                // Update filtered categories when search query changes
                Provider.of<CategoriesProvider>(context, listen: false)
                    .filterCategories(value);
              },
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text('${Provider.of<CategoriesProvider>(context).filteredCategories.length} '
                  'Categories Found',

                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],

                  )),
            ),

            // GridView of categories
            FutureBuilder<List<String>>(
              future: _categoriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<String> categories = snapshot.data!;
                  return Consumer<CategoriesProvider>(
                    builder: (context, provider, _) {
                      categories = provider.filteredCategories;
                      if (categories.isEmpty) {
                        return Center(child: Text('No Category found'));
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: provider.filteredCategories.length,
                          itemBuilder: (context, index) {
                            final category = provider.filteredCategories[index];
                            return CategoryCard(
                              image:
                              category.toLowerCase() == 'smartphones' ||
                                  category.toLowerCase() == 'laptops'
                                  ? 'assets/categories/${category.toLowerCase()}.jpg'
                                  : null,
                              title: category,
                              onTap: () {
                              // Navigate to ProductByCategory Screen and pass the category name
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductsbycategoryScreen(category: category),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
