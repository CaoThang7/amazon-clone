import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 10),
        Image.network(
          'https://sa.tinhte.vn/2015/05/3034128_tinhte.vn-macbook-12-1.jpg',
          height: 200,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Macbook pro m1',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.network(
              'https://sa.tinhte.vn/2015/05/3034128_tinhte.vn-macbook-12-1.jpg',
              fit: BoxFit.fitHeight,
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://sa.tinhte.vn/2015/05/3034128_tinhte.vn-macbook-12-1.jpg',
              fit: BoxFit.fitHeight,
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://sa.tinhte.vn/2015/05/3034128_tinhte.vn-macbook-12-1.jpg',
              fit: BoxFit.fitHeight,
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://sa.tinhte.vn/2015/05/3034128_tinhte.vn-macbook-12-1.jpg',
              fit: BoxFit.fitHeight,
              width: 100,
              height: 100,
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        ),
      ],
    );
  }
}
