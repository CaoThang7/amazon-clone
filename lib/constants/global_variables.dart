import 'package:flutter/material.dart';

String uri = 'http://10.0.3.2:3000/api';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 108, 223, 218),
      Color.fromARGB(255, 160, 242, 224),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const importantmessageColor = Color(0xff22A0B2);
  static const activeColor = Color(0xff168A9A);
  static const raidoTitleColor = Color(0xffFCF7F1);
  static const borderRadioColor = Color.fromARGB(255, 225, 194, 168);

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Shop Laptops',
      'image': 'assets/images/laptop.jpg',
    },
    {
      'title': 'Shop Deals',
      'image': 'assets/images/bicycle.jpg',
    },
    {
      'title': 'Beauty Picks',
      'image': 'assets/images/beautypick.jpg',
    },
    {
      'title': 'Womens Fashion',
      'image': 'assets/images/womenfashion.jpg',
    },
  ];

  static const importantTitle = "Important message";
  static const importantMessage =
      "For eligible orders shipped by Amazon, the standard method will be to deliver the package unattended at the front door.You can change the delivery location, or to arrange for the package to be delivered directly to the recipient from 'Add delivery instructions' or 'Unattended Preference' menu. However, we may not be able to adhere to the standard method or instructions depending on the order details.";
  static const subTitleRaidoCOD =
      "Domestic Delivery only.Please note that refunds are issued as Amazon Gift Certificates for order cancellations or returned items";
  static const subTitleRaidoPayments =
      "Items are shipped after payment is made \n\u{003E} Convenience store \n\u{003E} ATM \n\u{003E} Internet Bank \n\u{003E} e-Money";
  static const messageOrder =
      "Please check your email.Message Center or Your Orders pagefor order confirmation, Pay ID notification and detailed delivery infomation.";
}
