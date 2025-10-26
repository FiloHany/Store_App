import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        width: 200,
        height: 220,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(.2),
              offset: const Offset(10, 10)),
        ]),
        child: const Card(
          elevation: 10,
          // Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsetsGeometry.all(16)),
                Text(
                  'HandBag LV',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$225',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
