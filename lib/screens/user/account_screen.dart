import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/screens/user/widgets/app_bars.dart';
import 'package:amazon_clone/screens/user/widgets/below_app_bar.dart';
import 'package:amazon_clone/screens/user/widgets/orders.dart';
import 'package:amazon_clone/screens/user/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarAccount(context)),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          Orders(),
        ],
      ),
    );
  }
}
