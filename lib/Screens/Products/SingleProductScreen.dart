import 'package:flutter/material.dart';

class SingleProductScreen extends StatefulWidget {
  final Map<String, dynamic> productData;

  SingleProductScreen({required this.productData});

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  int itemCount = 1; // Default item count

  bool isWishlistSelected = false; // Whether the product is in the wishlist

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[800]),
          backgroundColor: const Color.fromARGB(255, 39, 222, 191),
          title: Image.asset(
            "Assets/img/app_logo.png",
            width: 170,
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.productData['photoUrl'],
                fit: BoxFit.cover,
                height: 300, // Increased image height for better display
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                  ),
                  Text(
                    widget.productData['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins-Regular', // Custom font family
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        'Price : ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-SemiBold',
                        ),
                      ),
                      Text(
                        '${widget.productData['price']}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Item Count: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins-SemiBold',
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  // Decrease item count
                                  if (itemCount > 1) {
                                    itemCount--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              itemCount.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins-Regular',
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  // Increase item count
                                  itemCount++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // Wishlist button
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // Toggle the wishlist icon
                            isWishlistSelected = !isWishlistSelected;
                          });
                        },
                        icon: Icon(
                          size: 38,
                          isWishlistSelected
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: const Color.fromRGBO(79, 91, 213,
                              1), // Change color based on wishlist status
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                  ),
                  Text(
                    widget.productData['description'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins-Regular', // Custom font family
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Check if color is available and display it
                  if (widget.productData['color'] != null)
                    Text(
                      'Color: ${widget.productData['color']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-SemiBold',
                      ),
                    ),

                  // Check if storage is available and display it
                  if (widget.productData['storage'] != null)
                    Text(
                      'Storage: ${widget.productData['storage']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-SemiBold',
                      ),
                    ),

                  // Check if rating is available and display it
                  if (widget.productData['rating'] != null)
                    Row(
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-SemiBold',
                          ),
                        ),
                        Text(
                          '${widget.productData['rating']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        const SizedBox(width: 3),
                        Image.asset("Assets/img/product/rating-img.png",
                            width: 85),
                      ],
                    ),

                  // Check if reviews count is available and display it
                  if (widget.productData['reviews'] != null)
                    Row(
                      children: [
                        const Text(
                          'Reviews: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-SemiBold',
                          ),
                        ),
                        Text(
                          '${widget.productData['reviews']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Icon(
                          Icons.message,
                          size: 18,
                        )
                      ],
                    ),

                  // Check if features are available and display them
                  if (widget.productData['features'] != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Features:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-SemiBold',
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.productData['features']
                              .map<Widget>((feature) => Text(
                                    '- $feature',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins-Regular',
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
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
