import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/models/get_recent_orders.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/home/order_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentOrderCard extends StatefulWidget {
  final Data recentData;
  final Function? onPressed;
  const RecentOrderCard({Key? key, required this.recentData, this.onPressed})
      : super(key: key);

  @override
  _RecentOrderCardState createState() => _RecentOrderCardState();
}

class _RecentOrderCardState extends State<RecentOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(context, dividedBy: 1),
        child: Container(
          width: screenWidth(context, dividedBy: 1),
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 30),
                    ),
                    Stack(
                      children: [
                        Container(
                            width: screenWidth(context, dividedBy: 1),
                            margin: EdgeInsets.only(
                                top: screenWidth(context, dividedBy: 40)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                      screenWidth(context, dividedBy: 30),
                                      vertical:
                                      screenHeight(context, dividedBy: 40)),
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
                                        label: "Order Id #" +
                                            widget.recentData.id.toString(),
                                        value: "\$" +
                                            (widget.recentData.payment!.price! +
                                                widget
                                                    .recentData.deliveryFee!)
                                                .toStringAsFixed(2),
                                        preparing: widget.recentData.orderStatus!
                                            .status! ==
                                            "Preparing"
                                            ? true
                                            : false,
                                        fontSize: 16.0,
                                        fontColor: widget.recentData.orderStatus!
                                            .status ==
                                            "Preparing"
                                            ? Constants.colors[5]
                                            : Constants.colors[6],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.recentData.createdAt
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                                fontFamily: "Padauk",
                                                fontWeight: FontWeight.w400),
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
                                      SizedBox(
                                        height: screenHeight(context,
                                            dividedBy: 60),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight(context, dividedBy: 80),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        widget.onPressed!();
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "View Details",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Constants.colors[6],
                                                fontFamily: "Padauk",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.keyboard_arrow_right_sharp,
                                              color: Constants.colors[6],
                                              size: 16),
                                          SizedBox(
                                            width: screenWidth(context,
                                                dividedBy: 40),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                        Positioned(
                          right: screenWidth(context, dividedBy: 3),
                          left: screenWidth(context, dividedBy: 3),
                          top: screenHeight(context, dividedBy: 200),
                          child: Container(
                            width: screenWidth(context, dividedBy: 4),
                            height: screenHeight(context, dividedBy: 30),
                            decoration: BoxDecoration(
                                color: Constants.colors[3],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                widget.recentData.orderStatus!.status!,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Constants.colors[0],
                                    fontFamily: "Padauk",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
