import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatefulWidget {
  final String label;
  final String value;
  final double fontSize;
  final bool preparing;
  final Color? fontColor;
  const OrderTile(
      {Key? key,
      required this.label,
      required this.value,
      this.fontSize = 13.0,
      this.preparing = false,
        this.fontColor,
      })
      : super(key: key);

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      child: Row(
        children: [
          Text(
            widget.label,
            style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.fontColor ??
                     Constants.colors[6],
                fontFamily: "Padauk",
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            widget.value,
            style: TextStyle(
                fontSize: widget.fontSize,
                color: Constants.colors[6],
                fontFamily: "Padauk",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
