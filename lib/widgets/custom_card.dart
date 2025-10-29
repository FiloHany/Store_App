import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.product,
    super.key,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withValues(alpha: 0.1),
                  offset: const Offset(10, 10)),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(16)),
                    Text(
                      '${product.title.substring(0 , 18)}...',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Icon(
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
        Positioned(
          bottom: 105,
          left: 52,
          child: Image.network(
              product.image,
              width: 130,
              height: 130,
            ),
        ),
        ],
      ),
    );
  }
}