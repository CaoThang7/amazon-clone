import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/screens/home/widgets/address_box.dart';
import 'package:amazon_clone/screens/home/widgets/app_bars.dart';
import 'package:amazon_clone/screens/home/widgets/carousel_image.dart';
import 'package:amazon_clone/screens/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/screens/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarHome(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(), // below appbar
            SizedBox(height: 10),
            TopCategories(),
            SizedBox(height: 10),
            CarouselImage(), // like slideshow web
            DealOfDay(),
          ],
        ),
      ),
    );
  }
}
