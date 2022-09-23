import 'package:flutter/material.dart';

class FoodItemScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const FoodItemScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<FoodItemScreen> createState() => _FoodItemScreenState();
}

class _FoodItemScreenState extends State<FoodItemScreen> {
  // List<Map<String, dynamic>> _foodItems = [];
  Map<String, dynamic> _foodItem = {};
  bool _isFavourite = false;

  @override
  void initState() {
    super.initState();
    _foodItem = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isFavourite = !_isFavourite;
              });
            },
            icon: Icon(
              _isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: _isFavourite ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Text(
                _foodItem['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: FadeInImage(
                    placeholder: const AssetImage(
                      'assets/food.png',
                    ),
                    image: NetworkImage(
                      _foodItem['img'],
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        '523 kkal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Energy',
                        style: TextStyle(
                            color: Colors.orange[800], fontSize: 20.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        '800 gr.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Weight',
                        style: TextStyle(
                            color: Colors.orange[800], fontSize: 20.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        '80 min.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Delivery',
                        style: TextStyle(
                            color: Colors.orange[800], fontSize: 20.0),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 36.0,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey[200] ?? Colors.grey,
                                blurRadius: 3.0,
                                spreadRadius: 6.0,
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 24.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add,
                              size: 28.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey[200] ?? Colors.grey,
                                blurRadius: 3.0,
                                spreadRadius: 6.0,
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 24.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.remove,
                              size: 28.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 36.0,
                  ),
                  const Expanded(
                    child: Text(
                      'Meat lover. get ready to meet your match! Loaded with beef, beef sausages, ground beef',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        fixedSize: const Size(
                          double.maxFinite,
                          60.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor: Colors.orange[800],
                        primary: Colors.white,
                      ),
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                      label: const Text(
                        'Add to cart',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 48.0,
                  ),
                  Text(
                    '\$ ${_foodItem['price']}',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.orange[800],
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
