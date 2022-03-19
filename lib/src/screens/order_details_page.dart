
import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/screens/notifications_page.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/appbar.dart';
import 'package:delivery_app/src/widgets/build_button.dart';
import 'package:delivery_app/src/widgets/home/order_tile.dart';
import 'package:delivery_app/src/widgets/order_details/amount_card.dart';
import 'package:delivery_app/src/widgets/order_details/order_details_card.dart';
import 'package:delivery_app/src/widgets/order_details/order_tab.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  final Datum orderData;
  const OrderDetailsPage({Key? key, required this.orderData}) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colors[2],
      appBar: AppBar(
        backgroundColor: Constants.colors[2],
        elevation: 0,
        leading: Container(),
        actions: [
          DeliveryAppBar(
            title: "Order Details",
            leftIcon: Icon(
              Icons.menu,
              color: Constants.colors[6],
            ),
            rightIcon: Icon(
              Icons.notifications_none_sharp,
              color: Constants.colors[6],
            ),
            onTapRightIcon: () {
              push(context, NotificationsPage());
            },
          ),
        ],
      ),
      body: Container(
        width:screenWidth(context),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: screenWidth(context, dividedBy: 1),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 30),
                    vertical: screenHeight(context, dividedBy: 40)),
                child: Column(
                  children: [
                    OrderDetailsCard(orderData: widget.orderData),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 30),
                    ),
                    /// hard coded data
                    OrderTab(),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 30),
                    ),
                    /// hard coded data
                    AmountCard(),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 30),
                    ),
                    /// hard coded data
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
                      child: OrderTile(
                        label: "Total",
                        value: "\$150.00",
                        fontSize: 16.0,
                        fontColor: Constants.colors[3],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: screenWidth(context, dividedBy: 4),
              right: screenWidth(context, dividedBy: 4),
              child:Column(
                children: [
                  BuildButton(onPressed: () {
                    showToast("Marked as Delivered");
                  }, label: "Mark as Delivered"),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 30),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
