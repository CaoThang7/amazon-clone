import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/screens/address/address_screen.dart';
import 'package:amazon_clone/screens/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/screens/admin/screen/admin_screen.dart';
import 'package:amazon_clone/screens/auth/auth_screen.dart';
import 'package:amazon_clone/screens/home/category_screen.dart';
import 'package:amazon_clone/screens/home/home_screen.dart';
import 'package:amazon_clone/screens/order/screens/my_order.dart';
import 'package:amazon_clone/screens/order/screens/order_detail.dart';
import 'package:amazon_clone/screens/order/screens/order_screen.dart';
import 'package:amazon_clone/screens/order/screens/order_success.dart';
import 'package:amazon_clone/screens/product/product_details_screen.dart';
import 'package:amazon_clone/screens/search/search_screen.dart';
import 'package:amazon_clone/widgets/bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminScreen(),
      );
    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderSuccess.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrderSuccess(),
      );
    case MyOrder.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyOrder(),
      );
    case OrderDetail.routeName:
      var orderItem = routeSettings.arguments;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetail(
          orderItem: orderItem,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('screen does not exist!'),
          ),
        ),
      );
  }
}
