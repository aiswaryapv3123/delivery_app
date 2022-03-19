import 'dart:convert';

import 'package:delivery_app/src/bloc/delivery_bloc.dart';
import 'package:delivery_app/src/bloc/events.dart';
import 'package:delivery_app/src/bloc/states.dart';
import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/screens/bottom_navigation_bar.dart';
import 'package:delivery_app/src/screens/notifications_page.dart';
import 'package:delivery_app/src/screens/order_details_page.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/appbar.dart';
import 'package:delivery_app/src/widgets/home/order_cards.dart';
import 'package:delivery_app/src/widgets/order_history/order_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final DeliveryBloc deliveryBloc = DeliveryBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deliveryBloc.add(GetOrderHistoryData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.colors[2],
        bottomNavigationBar: BottomBar(
          index: 2,
        ),
        appBar: AppBar(
          backgroundColor: Constants.colors[2],
          elevation: 0,
          leading: Container(),
          actions: [
            DeliveryAppBar(
              title: "Orders History",
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
        body: BlocProvider(
          create: (context) => deliveryBloc,
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth(context, dividedBy: 1),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 30),
                  vertical: screenHeight(context, dividedBy: 40)),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: screenHeight(context, dividedBy: 30),
                  // ),
                  BlocBuilder<DeliveryBloc, DeliveryStates>(
                      builder: (BuildContext context, DeliveryStates state) {
                        if (state is OrderHistoryErrorState) {
                          final error = state.error;
                          return SizedBox(
                            width: screenWidth(context, dividedBy: 1),
                            height: screenHeight(context, dividedBy: 1),
                            child: Center(
                              child: Text(
                                error.toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "JosefinSans"),
                              ),
                            ),
                          );
                        }
                        if (state is OrderHistoryLoadedState) {
                          print("Loaded State");
                          // print("Loaded State data" + state.employeeList.toString());
                          GetOrderList orderHistoryData = state.getOrderHistoryList;
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: ListView.builder(
                                itemCount: orderHistoryData.data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return Column(
                                    children: [
                                      OrderHistoryCard(orderData: orderHistoryData.data![index],
                                        onPressed: (){
                                          push(context, OrderDetailsPage(orderData: orderHistoryData.data![index],));
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                        screenHeight(context, dividedBy: 30),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        return SizedBox(
                          width: screenWidth(context, dividedBy: 1),
                          height: screenHeight(context, dividedBy: 1.4),
                          child: Center(
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Constants.colors[3],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
