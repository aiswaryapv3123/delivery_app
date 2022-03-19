import 'package:delivery_app/src/screens/home_page.dart';
import 'package:delivery_app/src/screens/order_history_page.dart';
import 'package:delivery_app/src/screens/profile_page.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int index;
  BottomBar({required this.index});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      currentIndex = widget.index;
    });
    super.initState();
  }

  final _pageOptions = [ProfilePage(), HomePage(), OrderHistoryPage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      height: screenHeight(context, dividedBy: 12),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 0;
                push(context, _pageOptions[0]);

              });
            },
            child:  Icon(
                  Icons.person_outline,
                  color: currentIndex == 0 ? Constants.colors[3] : Colors.grey,
                  size:20
              ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 1;
                push(context, _pageOptions[1]);
              });
            },
            child: Container(
              width: screenWidth(context, dividedBy: 8),
              height: screenWidth(context, dividedBy: 8),
              decoration: BoxDecoration(
                color: Constants.colors[3],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                      color: Colors.grey.withOpacity(0.4) )
                ],
              ),
              child: Icon(
                Icons.home,
                color: Constants.colors[0],
                size:20
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 2;
                push(context, _pageOptions[2]);
              });
            },
            child: Icon(
                  Icons.history,
                  color: currentIndex == 2 ? Constants.colors[3] : Colors.grey,
                  size:20
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
