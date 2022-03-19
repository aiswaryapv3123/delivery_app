import 'package:delivery_app/src/bloc/delivery_bloc.dart';
import 'package:delivery_app/src/bloc/events.dart';
import 'package:delivery_app/src/bloc/states.dart';
import 'package:delivery_app/src/models/get_recent_orders.dart';
import 'package:delivery_app/src/screens/bottom_navigation_bar.dart';
import 'package:delivery_app/src/screens/notifications_page.dart';
import 'package:delivery_app/src/screens/order_details_page.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/appbar.dart';
import 'package:delivery_app/src/widgets/order_history/order_history_card.dart';
import 'package:delivery_app/src/widgets/recent_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DeliveryBloc deliveryBloc = DeliveryBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deliveryBloc.add(GetRecentOrderData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomBar(
          index: 0,
        ),
        // appBar: AppBar(
        //   backgroundColor: Constants.colors[2],
        //   elevation: 0,
        //   leading: Container(),
        // actions: [
        //   DeliveryAppBar(
        //     title: "Profile",
        //     leftIcon: Icon(
        //       Icons.menu,
        //       color: Constants.colors[6],
        //     ),
        //     rightIcon: Icon(
        //       Icons.notifications_none_sharp,
        //       color: Constants.colors[6],
        //     ),
        //     onTapRightIcon: () {
        //       push(context, const NotificationsPage());
        //     },
        //   ),
        // ],
        // ),
        body: BlocProvider(
          create: (context) => deliveryBloc,
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth(context, dividedBy: 1),
              color:Constants.colors[2],
              child: Column(
                children: [
                  Container(
                      height: screenHeight(context, dividedBy: 2),
                      width: screenWidth(context, dividedBy: 1),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Constants.colors[3],
                            Constants.colors[4],
                          ],
                        ),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight(context, dividedBy: 20),
                          ),
                          DeliveryAppBar(
                            title: "Profile",
                            profile: true,
                            leftIcon: Icon(
                              Icons.menu,
                              color: Constants.colors[0],
                            ),
                            rightIcon: Icon(
                              Icons.notifications_none_sharp,
                              color: Constants.colors[0],
                            ),
                            onTapRightIcon: () {
                              push(context, const NotificationsPage());
                            },
                          ),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 10),
                          ),
                          Container(
                            width: screenWidth(context, dividedBy: 6),
                            height: screenWidth(context, dividedBy: 6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.colors[3].withOpacity(0.7),
                            ),
                            child: Center(
                              child: Icon(Icons.person,
                                  color: Constants.colors[0].withOpacity(0.6),
                                  size: 50),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 50),
                          ),

                          /// hard coded data

                          const Text("reonDeliverBoy",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Padauk")),
                          const Text("Thrithalloor,ourathur, malappuram",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: "Padauk"))
                        ],
                      )),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 40),
                  ),
                  Container(
                    // height: screenHeight(context, dividedBy: 2),
                    width: screenWidth(context, dividedBy: 1),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context, dividedBy: 30)),
                    color:Constants.colors[2],
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Constants.colors[6],
                            ),
                            SizedBox(
                              width:screenWidth(context, dividedBy:30)
                            ),
                            Text("About",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.colors[6],
                                    fontFamily: "Padauk")),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 40),
                        ),
                        Center(
                          child: Text("Delivery Address",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.colors[6],
                                  fontFamily: "Padauk")),
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 40),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Constants.colors[6],
                            ),
                            SizedBox(
                                width:screenWidth(context, dividedBy:30)
                            ),
                            Text("Recent Orders",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.colors[6],
                                    fontFamily: "Padauk")),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 40),
                        ),
                        BlocBuilder<DeliveryBloc, DeliveryStates>(builder:
                            (BuildContext context, DeliveryStates state) {
                          if (state is RecentOrderErrorState) {
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
                          if (state is RecentOrderLoadedState) {
                            print("Loaded State");
                            // print("Loaded State data" + state.employeeList.toString());
                            GetRecentOrder recentOrder = state.getRecentOrder;
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: ListView.builder(
                                  itemCount: recentOrder.data!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        RecentOrderCard(
                                            recentData:
                                                recentOrder.data![index],
                                            onPressed: () {}),
                                        SizedBox(
                                          height: screenHeight(context,
                                              dividedBy: 30),
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
                            height: screenHeight(context, dividedBy: 2),
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
                ],
              ),
            ),
          ),
        ));
  }
}
