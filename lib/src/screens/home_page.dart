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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DeliveryBloc deliveryBloc = DeliveryBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deliveryBloc.add(GetOrderListData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.colors[2],
        bottomNavigationBar: BottomBar(
          index: 1,
        ),
        appBar: AppBar(
          backgroundColor: Constants.colors[2],
          elevation: 0,
          leading: Container(),
          actions: [
            DeliveryAppBar(
              title: "Orders",
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
                    if (state is OrderErrorState) {
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
                    if (state is OrderLoadedState) {
                      print("Loaded State");
                      // print("Loaded State data" + state.employeeList.toString());
                      GetOrderList orderData = state.getOrderList;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: ListView.builder(
                            itemCount: orderData.data!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                   OrderCard(orderData: orderData.data![index],
                                     onPressed: (){
                                     push(context, OrderDetailsPage(orderData: orderData.data![index],));
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
