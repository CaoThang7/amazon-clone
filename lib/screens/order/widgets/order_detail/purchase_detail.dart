import 'package:flutter/material.dart';

class PurchaseDetail extends StatefulWidget {
  final orderItems;
  const PurchaseDetail({Key? key, required this.orderItems}) : super(key: key);

  @override
  State<PurchaseDetail> createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Purchase Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 197, 192, 192))),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(widget.orderItems['product_id']['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        "quantity: ${widget.orderItems['quantity'].toString()}"),
                    leading: Hero(
                      tag: widget.orderItems,
                      child: Image.network(
                        widget.orderItems['product_id']['images'][0],
                        fit: BoxFit.contain,
                        height: 150,
                        width: 80,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
