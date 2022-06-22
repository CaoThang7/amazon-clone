import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class RadioButtonGroup extends StatefulWidget {
  final int valueRaido;
  final int paymentValue;
  final String? payment_methods;
  final String? title;
  final String? subtitle;
  final Color titleColor;
  final onchange;
  const RadioButtonGroup({
    Key? key,
    required this.valueRaido,
    required this.paymentValue,
    required this.payment_methods,
    required this.title,
    required this.subtitle,
    required this.titleColor,
    this.onchange,
  }) : super(key: key);

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: GlobalVariables.borderRadioColor)),
          child: Column(
            children: [
              RadioListTile(
                title: Text(
                  widget.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.subtitle!,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 81, 81, 81)),
                ),
                value: widget.valueRaido,
                groupValue: widget.paymentValue,
                onChanged: widget.onchange,
                contentPadding: EdgeInsets.all(15),
                activeColor: GlobalVariables.activeColor,
                tileColor: widget.titleColor,
              ),
            ],
          )),
    );
  }
}
