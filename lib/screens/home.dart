import 'package:ecommerce_app_test/logic/api.dart';
import 'package:ecommerce_app_test/widgets/card.dart';
import 'package:flutter/material.dart';

import 'food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _foodItems = [];
  final Map<String, dynamic> _cartItems = {};

  void _addToCart(String key, String item) {
    _cartItems.putIfAbsent(key, () => item);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ApiService().getFoodItems().then((value) {
      setState(() {
        _foodItems = value;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Food items have been populated'),
        ),
      );
    });
  }

  final int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Hi ',
                    children: [
                      TextSpan(
                        text: 'Vadmin!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  cursorColor: Colors.grey[700],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[600],
                    ),
                    hintText: 'Find what you want...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                decoration: ShapeDecoration(
                  color: Colors.green[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Free Combo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          'Burger + Coca-Cola\nfor new users',
                          style: TextStyle(
                            color: Colors.white,
                            // fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/pie.png',
                      width: 100.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: SizedBox(
                  height: 90,
                  child: ListView(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    children: const [
                      CategoryCard(title: 'Burgers', icon: Icons.cake),
                      CategoryCard(title: 'Pizza', icon: Icons.local_pizza),
                      CategoryCard(title: 'Drinks', icon: Icons.no_drinks),
                      CategoryCard(title: 'Chicken', icon: Icons.foggy),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Text(
                  'Top Products',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _foodItems.length,
                  itemBuilder: (ext, index) {
                    final foodItem = _foodItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => FoodItemScreen(
                              item: foodItem,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5),
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: ShapeDecoration(
                          color: const Color(0XFFE0E0E0).withOpacity(.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: FadeInImage(
                                placeholder: const AssetImage(
                                  'assets/food.png',
                                ),
                                image: NetworkImage(
                                  foodItem['img'],
                                ),
                                width: 120.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          foodItem['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          '\$ ${foodItem['price']}',
                                          style: TextStyle(
                                            color: Colors.orange[700],
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _addToCart(
                                        foodItem['id'],
                                        foodItem['name'],
                                      );
                                    },
                                    icon: const CircleAvatar(
                                      radius: 24.0,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.add,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orange[800],
          selectedFontSize: 16.0,
          unselectedFontSize: 16.0,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    const Icon(
                      Icons.shopping_basket_outlined,
                    ),
                    Positioned(
                      bottom: -2.0,
                      right: -2.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.orange[800],
                        radius: 8.0,
                        child: Text(
                          _cartItems.length.toString(),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.replay_outlined,
              ),
              label: '',
            ),
          ]),
    );
  }
}
