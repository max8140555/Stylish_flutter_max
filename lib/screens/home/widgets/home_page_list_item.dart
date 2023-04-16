import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stylish_max/models/product.dart';
import 'package:stylish_max/screens/detail/detail_page.dart';

class HomePageListItem extends StatelessWidget {
  const HomePageListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: LayoutBuilder(builder: (context, container) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
                  child: CachedNetworkImage(
                    height: container.maxHeight,
                    width: container.maxWidth / 3,
                    imageUrl: product.images.isNotEmpty ? product.images[0] : "",
                    placeholder: (context, url) => Image.asset(
                      'assets/images/stylish_logo.png',
                      height: container.maxHeight,
                      width: container.maxWidth / 3,
                      fit: BoxFit.fitWidth,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text("\$ ${product.price}")
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
