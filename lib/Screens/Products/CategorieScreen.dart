import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/DataReading.dart';
import 'package:login/Screens/Products/SingleProductScreen.dart';

class CategorieScreen extends StatefulWidget {
  final String categoryKey; // Add a categoryKey parameter

  const CategorieScreen(
      {super.key,
      required this.categoryKey}); // Constructor to receive the category key

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  Future<List<CategoriesApiReading>> productName() async {
    final data = await rootBundle.loadString(
        "Assets/Apis/${widget.categoryKey}Products.json"); // Use categoryKey to load data
    final jsonData = json.decode(data) as List;

    List<CategoriesApiReading> productsList =
        jsonData.map((item) => CategoriesApiReading.fromJson(item)).toList();

    return productsList;
  }

  @override
  void initState() {
    super.initState();
    productName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        backgroundColor: const Color.fromARGB(255, 39, 222, 191),
        title: Image.asset(
          "Assets/img/app_logo.png",
          width: 170,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CategoriesApiReading>>(
        future: productName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<CategoriesApiReading> products = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 14, 8, 10),
              child: ListView.builder(
                itemCount: (products.length / 2).ceil(), // Adjust item count
                itemBuilder: (context, index) {
                  final firstProductIndex = index * 2;
                  final secondProductIndex = firstProductIndex + 1;

                  return Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          onTap: () {
                            final productMap =
                                products[firstProductIndex].toJson();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleProductScreen(
                                  productData: productMap,
                                ),
                              ),
                            );
                          },
                          product: products[firstProductIndex],
                        ),
                      ),
                      if (secondProductIndex < products.length)
                        Expanded(
                          child: ProductCard(
                            onTap: () {
                              final productMap =
                                  products[secondProductIndex].toJson();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleProductScreen(
                                    productData: productMap,
                                  ),
                                ),
                              );
                            },
                            product: products[secondProductIndex],
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final CategoriesApiReading product;
  final VoidCallback? onTap;

  ProductCard({required this.product, required this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          // Call the onTap callback when the IconButton is pressed
          widget.onTap!();
        }
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.product.photoUrl!,
              fit: BoxFit.cover,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.product.name!.length > 25 // Adjust the limit as needed
                    ? widget.product.name!.substring(0, 25) +
                        '...' // Truncate and add ellipsis
                    : widget.product.name!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-SemiBold"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset("Assets/img/product/rating-img.png", width: 60),
                    Text(
                      widget.product.rating!,
                      style: const TextStyle(
                          fontSize: 14, fontFamily: "Poppins-Regular"),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.product.price!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins-SemiBold"),
                    ),
                    SizedBox(width: 14),
                    IconButton(
                      onPressed: () {
                        // Handle IconButton onPressed as needed
                        setState(() {
                          isPressed = !isPressed;
                        });

                        if (isPressed) {
                          // Show a toast message when the product is added to the wishlist
                          Fluttertoast.showToast(
                            msg: 'Product added to wishlist',
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 1,
                          );
                        } else {
                          // Show a toast message when the product is removed from the wishlist
                          Fluttertoast.showToast(
                            msg: 'Product removed from wishlist',
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 1,
                          );
                        }
                      },
                      icon: isPressed
                          ? const Icon(
                              Icons.favorite,
                              size: 22,
                              color: Color.fromRGBO(79, 91, 213, 1),
                            )
                          : const Icon(
                              Icons.favorite_border, // Initial icon
                              size: 22,
                              color: Color.fromRGBO(79, 91, 213, 1),
                            ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
