import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/Screens/Products/CategorieScreen.dart';
import 'package:login/utiles/InternetUtils.dart';

class HomeSc extends StatefulWidget {
  const HomeSc({super.key});

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  Future<bool> _onBackPressed() async {
    // Show confirmation dialog when the back button is pressed
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Exit the Application?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            content: const Text(
              'Are you sure you want to leave Tech App?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Stay on the screen
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Leave the Privacy Policy
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  var userName = FirebaseAuth.instance.currentUser?.displayName;

  final List<String> _imagePaths = [
    'Assets/img/slider-1.png',
    'Assets/img/slider-2.png',
    'Assets/img/slider-3.png',
    'Assets/img/slider-4.png'
  ];

  final List<Map<String, String>> _categoryData = [
    {
      'title': 'Mobile',
      'imagePath': 'Assets/img/product/categories/mobile_categories_Logo.png',
      'categoryKey': 'Mobile',
    },
    {
      'title': 'Laptop',
      'imagePath': 'Assets/img/product/categories/laptop_categories_Logo.png',
      'categoryKey': 'Laptop',
    },
    {
      'title': 'Headphone',
      'imagePath':
          'Assets/img/product/categories/headphone_categories_Logo.png',
      'categoryKey': 'HeadPhone',
    },
    {
      'title': 'Refridger',
      'imagePath':
          'Assets/img/product/categories/refridger_categories_Logo.png',
      'categoryKey': 'Refridger',
    },
    {
      'title': 'Router',
      'imagePath': 'Assets/img/product/categories/router_categories_Logo.png',
      'categoryKey': 'Router',
    },
    {
      'title': 'Smart Watch',
      'imagePath':
          'Assets/img/product/categories/smartwatch_categories_Logo.png',
      'categoryKey': 'Smartwatch',
    },
    {
      'title': 'TVs',
      'imagePath': 'Assets/img/product/categories/tv_categories_Logo.png',
      'categoryKey': 'Tvs',
    },
    {
      'title': 'Speaker',
      'imagePath': 'Assets/img/product/categories/speaker_categories_Logo.png',
      'categoryKey': 'Speaker',
    },
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );

    // Start automatic slideshow
    _startSlideshow();
  }

  void _startSlideshow() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentIndex == _imagePaths.length - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex++;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      _startSlideshow();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 189,
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _imagePaths.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categoryData.map((data) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: InkWell(
                          onTap: () {
                            final categoryKeys =
                                data['categoryKey']; // Get the category key
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategorieScreen(
                                    categoryKey: categoryKeys ?? ""),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(data['imagePath']!),
                                radius: 35,
                              ),
                              const SizedBox(
                                  height: 5), // Adjust spacing if needed
                              Text(
                                data['title']!,
                                style: const TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Latest Product",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 24, fontFamily: "Poppins-SemiBold"),
                ),
                const SizedBox(height: 12),
                LatestProduct(),
                const SizedBox(height: 12),
                const Text(
                  "Special Deals For You ❤️",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 24, fontFamily: "Poppins-SemiBold"),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius value as needed
                        child:
                            Image.asset("Assets/img/product/Mobile_offer.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius value as needed
                        child:
                            Image.asset("Assets/img/product/laptop_offer.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius value as needed
                        child: Image.asset(
                            "Assets/img/product/headphone_offer.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius value as needed
                        child: Image.asset("Assets/img/product/tvs_offer.png"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class LatestProduct extends StatefulWidget {
  @override
  State<LatestProduct> createState() => _LatestProductState();
}

class _LatestProductState extends State<LatestProduct> {
  bool isPressed = false;
  final List product = [
    {
      "name": "iPhone 14",
      "rating": "4.2",
      "price": "₹1,80,000",
      "imageUrl": "Assets/img/product/mobile/iPhone.png",
      "categoryKey": "Mobile"
    },
    {
      "name": "Dell XPS 13",
      "rating": "4.8",
      "price": "₹1,04,999",
      "imageUrl": "Assets/img/product/laptop/Dell-XPS-13.png",
      "categoryKey": "Laptop"
    },
    {
      "name": "Sony WF-1000XM4",
      "rating": "4.9",
      "price": "19,499",
      "imageUrl": "Assets/img/product/headphone/Sony-WF-1000XM4.png",
      "categoryKey": "HeadPhone"
    },
    {
      "name": "Amazfit GTS 3",
      "rating": "4.8",
      "price": "₹18,499",
      "imageUrl": "Assets/img/product/smartwatch/Amazfit-GTS-3.png",
      "categoryKey": "Smartwatch"
    },
    {
      "name": "oppo A17",
      "rating": "4.2",
      "price": "₹12,500",
      "imageUrl": "Assets/img/product/mobile/oppo-A17.png",
      "categoryKey": "Mobile"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: product.map((data) {
              return GestureDetector(
                onTap: () {
                  var categoryKey = data['categoryKey'];
                  // Navigate to the category screen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategorieScreen(categoryKey: categoryKey),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        data['imageUrl'],
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data['name'],
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
                              Image.asset("Assets/img/product/rating-img.png",
                                  width: 60),
                              Text(
                                data['rating'],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Poppins-Regular"),
                              ),
                            ],
                          )),
                      const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Learn More",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins-SemiBold"),
                            ),
                          )),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
