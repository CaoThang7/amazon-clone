import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';
import '../services/cart_services.dart';

class CartCard extends StatefulWidget {
  final dataProduct;
  final int index;
  const CartCard({Key? key, required this.dataProduct, required this.index})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final CartServices cartServices = CartServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void increaseQuantity(Product product) {
    cartServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    MoneyFormatter price = MoneyFormatter(
        amount: widget.dataProduct['product_id']['price'].toDouble());
    final productCart =
        context.watch<CartProvider>().cart.cartItems[widget.index];
    final product = Product.fromMap(productCart['product_id']);
    final quantity = productCart['quantity'];

    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Image.network(
                  widget.dataProduct['product_id']['images'][0],
                  fit: BoxFit.contain,
                  height: 100,
                  width: 135,
                ),
                Column(
                  children: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.dataProduct['product_id']['name'],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        '${price.output.symbolOnLeft}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: const Text('Eligible for FREE Shipping'),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 10, top: 5),
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
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => decreaseQuantity(product),
                        child: Container(
                          width: 35,
                          height: 32,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.remove,
                            size: 18,
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Container(
                          width: 35,
                          height: 32,
                          alignment: Alignment.center,
                          child: Text(
                            quantity.toString(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => increaseQuantity(product),
                        child: Container(
                          width: 35,
                          height: 32,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
