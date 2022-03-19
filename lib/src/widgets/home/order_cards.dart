import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/home/order_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final Datum orderData;
  final Function? onPressed;
  const OrderCard({Key? key, required this.orderData, this.onPressed})
      : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(context, dividedBy: 1),
        child: Container(
          width: screenWidth(context, dividedBy: 1),
          child: Stack(
            children: [
              // Container(
              //   width: screenWidth(context, dividedBy: 1),
              //   height: screenHeight(context, dividedBy: 3),
              //   decoration: BoxDecoration(
              //     color: Colors.transparent,
              //   ),
              // ),
              Positioned(
                // top: Util().screenHeight(context, dividedBy: 4),
                // left:10,
                // right:10,
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
                                            widget.orderData.id.toString(),
                                        value: "\$" +
                                            (widget.orderData.payment!.price! +
                                                    widget
                                                        .orderData.deliveryFee!)
                                                .toStringAsFixed(2),
                                        preparing: widget.orderData.orderStatus!
                                                    .status!.index ==
                                                2
                                            ? true
                                            : false,
                                        fontSize: 16.0,
                                        fontColor: widget.orderData.orderStatus!
                                                    .status!.index ==
                                                2
                                            ? Constants.colors[5]
                                            : Constants.colors[6],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.orderData.createdAt
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
                                      widget.orderData.orderStatus!.status!
                                                  .index ==
                                              2
                                          ? Column(children: [
                                              OrderTile(
                                                label: "Delivery Fee",
                                                value: "\$" +
                                                    widget.orderData.deliveryFee
                                                        .toString(),
                                                preparing: widget
                                                            .orderData
                                                            .orderStatus!
                                                            .status!
                                                            .index ==
                                                        2
                                                    ? true
                                                    : false,
                                              ),
                                              OrderTile(
                                                label: "TAX(" +
                                                    widget.orderData.tax
                                                        .toString() +
                                                    "%)",
                                                value: "\$" +
                                                    widget.orderData.payment!
                                                        .price
                                                        .toString(),
                                                preparing: widget
                                                            .orderData
                                                            .orderStatus!
                                                            .status!
                                                            .index ==
                                                        2
                                                    ? true
                                                    : false,
                                              ),
                                              OrderTile(
                                                label: "Total",
                                                fontSize: 16,
                                                value: (widget.orderData
                                                            .payment!.price! +
                                                        widget.orderData
                                                            .deliveryFee!)
                                                    .toString(),
                                                preparing: widget
                                                            .orderData
                                                            .orderStatus!
                                                            .status!
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
                                widget.orderData.orderStatus!.status!.index == 0
                                    ? " Delivered"
                                    : widget.orderData.orderStatus!.status!
                                                .index ==
                                            1
                                        ? "On the Way"
                                        : "Preparing",
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
        // child: Stack(
        //   children: [
        //     Container(
        //       width: screenWidth(context, dividedBy: 1),
        //       // color:Colors.blue,
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Container(
        //             padding: EdgeInsets.symmetric(
        //                 horizontal: screenWidth(context, dividedBy: 30),
        //                 vertical: screenHeight(context, dividedBy: 40)),
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(9),
        //               boxShadow: [
        //                 BoxShadow(
        //                     blurRadius: 2,
        //                     spreadRadius: 2,
        //                     offset: Offset(2, 2),
        //                     color: Colors.grey.withOpacity(0.2))
        //               ],
        //             ),
        //             child: Column(
        //               children: [
        //                 OrderTile(
        //                   label: "Order Id #" + widget.orderData.id.toString(),
        //                   value: "\$" +
        //                       widget.orderData.deliveryFee!.toStringAsFixed(2),
        //                   preparing:
        //                       widget.orderData.orderStatus!.status!.index == 2
        //                           ? true
        //                           : false,
        //                   fontSize: 16.0,
        //                   fontColor:
        //                       widget.orderData.orderStatus!.status!.index == 2
        //                           ? Constants.colors[5]
        //                           : Constants.colors[6],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Text(
        //                       widget.orderData.createdAt.toString(),
        //                       style: TextStyle(
        //                           fontSize: 13,
        //                           color: Colors.grey,
        //                           fontFamily: "Padauk",
        //                           fontWeight: FontWeight.w400),
        //                     ),
        //                     const Spacer(),
        //                     Text(
        //                       "Cash on Delivery",
        //                       style: TextStyle(
        //                           fontSize: 13,
        //                           color: Constants.colors[6],
        //                           fontFamily: "Padauk",
        //                           fontWeight: FontWeight.w400),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: screenHeight(context, dividedBy: 60),
        //                 ),
        //                 widget.orderData.orderStatus!.status!.index == 2
        //                     ? Column(children: [
        //                         OrderTile(
        //                           label: "Delivery Fee",
        //                           value: "\$" +
        //                               widget.orderData.deliveryFee.toString(),
        //                           preparing: widget.orderData.orderStatus!
        //                                       .status!.index ==
        //                                   2
        //                               ? true
        //                               : false,
        //                         ),
        //                         OrderTile(
        //                           label: "TAX(" +
        //                               widget.orderData.tax.toString() +
        //                               "%)",
        //                           value: "\$" +
        //                               widget.orderData.payment!.price
        //                                   .toString(),
        //                           preparing: widget.orderData.orderStatus!
        //                                       .status!.index ==
        //                                   2
        //                               ? true
        //                               : false,
        //                         ),
        //                         OrderTile(
        //                           label: widget.orderData.createdAt.toString(),
        //                           value: "Cash on Delivery",
        //                           preparing: widget.orderData.orderStatus!
        //                                       .status!.index ==
        //                                   2
        //                               ? true
        //                               : false,
        //                         ),
        //                       ])
        //                     : Container(),
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             height: screenHeight(context, dividedBy: 80),
        //           ),
        //           Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        //             GestureDetector(
        //               child: Row(
        //                 children: [
        //                   Text(
        //                     "View Details",
        //                     style: TextStyle(
        //                         fontSize: 13,
        //                         color: Constants.colors[6],
        //                         fontFamily: "Padauk",
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                   Icon(Icons.keyboard_arrow_right_sharp,
        //                       color: Constants.colors[6], size: 16),
        //                   SizedBox(
        //                     width: screenWidth(context, dividedBy: 40),
        //                   )
        //                 ],
        //               ),
        //             )
        //           ])
        //         ],
        //       ),
        //       // ),
        //     ),
        //     Align(
        //      alignment: Alignment.topCenter,
        //       child: Container(
        //         width: screenWidth(context, dividedBy: 4),
        //         height: screenHeight(context, dividedBy: 30),
        //         decoration: BoxDecoration(
        //             color: Constants.colors[3],
        //             borderRadius: BorderRadius.circular(20)),
        //         child: Center(
        //           child: Text(
        //             widget.orderData.orderStatus!.status!.index == 0
        //                 ? " Delivered"
        //                 : widget.orderData.orderStatus!.status!.index == 1
        //                     ? "On the Way"
        //                     : "Preparing",
        //             style: TextStyle(
        //                 fontSize: 13,
        //                 color: Constants.colors[0],
        //                 fontFamily: "Padauk",
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
