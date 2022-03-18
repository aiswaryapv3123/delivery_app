import 'package:delivery_app/src/bloc/delivery_bloc.dart';
import 'package:delivery_app/src/bloc/events.dart';
import 'package:delivery_app/src/bloc/states.dart';
import 'package:delivery_app/src/models/get_notifications.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/appbar.dart';
import 'package:delivery_app/src/widgets/notifications/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  final DeliveryBloc deliveryBloc = DeliveryBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deliveryBloc.add(GetNotificationsData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.colors[2],
        // bottomNavigationBar: BottomBar(
        //   index: 1,
        // ),
        appBar: AppBar(
          backgroundColor: Constants.colors[2],
          elevation: 0,
          leading: Container(),
          // title: Text("Orders",
          //     style: TextStyle(
          //         fontSize: 13,
          //         color: Constants.colors[3],
          //         fontFamily: "Padauk",
          //         fontWeight: FontWeight.w700)),
          actions: [
            DeliveryAppBar(
              title: "Notifications",
              leftIcon: Icon(
                Icons.menu,
                color: Constants.colors[6],
              ),
              rightIcon: Icon(
                Icons.notifications_none_sharp,
                color: Constants.colors[6],
              ),
              onTapRightIcon: (){
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
                  Container(
                    width: screenWidth(context, dividedBy: 1),
                    child: Row(
                      children:[
                        Icon(Icons.notifications, color:Constants.colors[6]),
                        SizedBox(
                          width:screenWidth(context, dividedBy:30),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                              "Notifications",
                              style: TextStyle(
                                  fontSize: 16,
                                  color:Constants.colors[6],
                                  fontFamily: "Padauk",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screenHeight(context, dividedBy: 200),
                            ),
                            const Text(
                              "Swipe left the notification to delete or read/unread it",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: "Padauk",
                                  fontWeight: FontWeight.w500),
                            ),
                          ]
                        )
                      ]
                    ),
                  ),
                  SizedBox(
                    height:
                    screenHeight(context, dividedBy: 40),
                  ),
                  BlocBuilder<DeliveryBloc, DeliveryStates>(
                      builder: (BuildContext context, DeliveryStates state) {
                        if (state is NotificationsErrorState) {
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
                        if (state is NotificationsLoadedState) {
                          print("Notifications Loaded State");
                          // print("Loaded State data" + state.employeeList.toString());
                          GetNotifications notifications = state.getNotifications;
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: ListView.builder(
                                itemCount: notifications.data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return Column(
                                    children: [
                                      NotificationTile(
                                        notifications: notifications.data![index],
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
                          child:  Center(
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
