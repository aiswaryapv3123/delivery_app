import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/home/order_tile.dart';
import 'package:delivery_app/src/widgets/order_details/amount_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailsCard extends StatefulWidget {
  final Datum orderData;
  final Function? onPressed;
  const OrderDetailsCard({Key? key, required this.orderData, this.onPressed})
      : super(key: key);

  @override
  _OrderDetailsCardState createState() => _OrderDetailsCardState();
}

class _OrderDetailsCardState extends State<OrderDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      child: Stack(
        children: [
          Container(
            width: screenWidth(context, dividedBy: 1),
            // color:Colors.blue,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
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
                        label: "Order Id #" + widget.orderData.id.toString(),
                        value: "\$" +
                            (widget.orderData.payment!.price! +
                                    widget.orderData.deliveryFee!)
                                .toStringAsFixed(2),
                        preparing:
                            widget.orderData.orderStatus!.status!.index == 2
                                ? true
                                : false,
                        fontSize: 16.0,
                        fontColor:
                            widget.orderData.orderStatus!.status!.index == 2
                                ? Constants.colors[5]
                                : Constants.colors[6],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.orderData.orderStatus!.status!.index == 0
                                ? "Delivered"
                                : widget.orderData.orderStatus!.status!.index ==
                                        1
                                    ? "On the Way"
                                    : "Preparing",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: "Padauk",
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(
                            "Cash on Delivery",
                            style: TextStyle(
                                fontSize: 13,
                                color: Constants.colors[6],
                                fontFamily: "Padauk",
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.orderData.createdAt.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: "Padauk",
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "Items : " +
                                widget.orderData.productOrders!.length
                                    .toString(),
                            style: TextStyle(
                                fontSize: 13,
                                color: Constants.colors[6],
                                fontFamily: "Padauk",
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 60),
                      ),
                      widget.orderData.orderStatus!.status!.index == 2
                          ? Column(children: [
                              OrderTile(
                                label: "Delivery Fee",
                                value: "\$" +
                                    widget.orderData.deliveryFee.toString(),
                                preparing: widget.orderData.orderStatus!.status!
                                            .index ==
                                        2
                                    ? true
                                    : false,
                              ),
                              OrderTile(
                                label: "TAX(" +
                                    widget.orderData.tax.toString() +
                                    "%)",
                                value: "\$" +
                                    widget.orderData.payment!.price.toString(),
                                preparing: widget.orderData.orderStatus!.status!
                                            .index ==
                                        2
                                    ? true
                                    : false,
                              ),
                              OrderTile(
                                label: widget.orderData.createdAt.toString(),
                                value: "Cash on Delivery",
                                preparing: widget.orderData.orderStatus!.status!
                                            .index ==
                                        2
                                    ? true
                                    : false,
                              ),
                            ])
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 80),
                ),
              ],
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
