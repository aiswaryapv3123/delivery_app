import 'package:delivery_app/src/models/get_notifications.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  final Datum notifications;
  const NotificationTile({Key? key, required this.notifications}) : super(key: key);

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth(context, dividedBy: 40)),
      child: Row(
        children: [
          Container(
              width: screenWidth(context, dividedBy: 6),
              height: screenWidth(context, dividedBy: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blueGrey.withOpacity(0.5),
                    Colors.grey.withOpacity(0.1)
                  ],
                ),
              ),
              child: Center(
                child: Icon(Icons.notifications,
                    color: Constants.colors[0].withOpacity(0.6), size: 30),
              )),
          SizedBox(width: screenWidth(context, dividedBy: 30)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.notifications.data?? "No content",
                style: TextStyle(
                    fontSize: 14,
                    color: Constants.colors[6],
                    fontFamily: "Padauk",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 200),
              ),
               Text(
                widget.notifications.createdAt.toString(),
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: "Padauk",
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
