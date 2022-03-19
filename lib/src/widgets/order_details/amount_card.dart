import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/home/order_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountCard extends StatefulWidget {
  const AmountCard({Key? key})
      : super(key: key);

  @override
  _AmountCardState createState() => _AmountCardState();
}

class _AmountCardState extends State<AmountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 30),
            vertical: screenHeight(context, dividedBy: 40)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2, 2),
                color: Colors.grey.withOpacity(0.2))
          ],
        ),
        child: Column(
          children: [
            OrderTile(
              label: "Subtotal" ,
              value: "\$50.00",
              fontSize: 16.0,
              fontColor: Constants.colors[6],
            ),
            OrderTile(
              label: "Delivery Fee" ,
              value: "\$50.00",
              fontSize: 16.0,
              fontColor: Constants.colors[6],
            ),
            OrderTile(
              label: "Tax (5.0%)" ,
              value: "\$50.00",
              fontSize: 16.0,
              fontColor: Constants.colors[6],
            ),
          ],
        ),
      ),
    );
  }
}
