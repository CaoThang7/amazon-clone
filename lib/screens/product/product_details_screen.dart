import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/screens/cart/services/cart_services.dart';
import 'package:amazon_clone/screens/product/widget/expansion_tile.dart';
import 'package:amazon_clone/screens/search/search_screen.dart';
import 'package:amazon_clone/widgets/custom_button.dart';
import 'package:amazon_clone/widgets/stars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CartServices cartServices = CartServices();
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    cartServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: widget.product.price.toDouble(),
    ); // Format money
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 25, //icon back leading width is 25
          centerTitle: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        suffixIcon: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Icon(
                                Icons.qr_code_scanner,
                                color: Colors.black54,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.mic_none_rounded,
                                color: Colors.black54,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Amazon',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visit the App Store',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Stars(
                      rating: 4,
                    ),
                  ],
                ),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            TileExpansion(
              tileName: "Price",
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontsize: 18,
              tileProduct:
                  fmf.output.symbolOnLeft, // $ 12,345,678.90 (price like this)
              tileNote:
                  "No Import Fees Deposit & 28.72 USD Shipping to Vietnam",
            ),
            TileExpansion(
              tileName: "Description",
              tileProduct: widget.product.description,
              fontsize: 16,
              tileNote: "",
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: 'Add to Cart',
                onTap: addToCart,
                color: const Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: 'Buy Now',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
