import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/widgets/stars.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  final Product product;
  const SearchCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  Image.network(
                    widget.product.images[0],
                    fit: BoxFit.fill,
                    height: 100,
                    width: 130,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(left: 10, top: 1),
                        child: Stars(
                          rating: 4,
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: Text(
                          '\$${widget.product.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: const Text('Ships in VietNam'),
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: const Text(
                          'In Stock',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
