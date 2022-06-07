import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TileExpansion extends StatefulWidget {
  final String tileName;
  final String tileProduct;
  final String tileNote;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontsize;
  const TileExpansion({
    Key? key,
    required this.tileName,
    required this.tileProduct,
    required this.tileNote,
    this.color,
    this.fontWeight,
    required this.fontsize,
  }) : super(key: key);

  @override
  State<TileExpansion> createState() => _TileExpansionState();
}

class _TileExpansionState extends State<TileExpansion> {
  UniqueKey? keyTile;
  bool isExpanded = false;
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            widget.tileName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tileProduct,
                        style: TextStyle(
                          fontWeight: widget.fontWeight,
                          color: widget.color,
                          fontSize: widget.fontsize,
                        ),
                      ),
                      Text(
                        widget.tileNote,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
