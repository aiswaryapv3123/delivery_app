import 'package:delivery_app/src/screens/home_page.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          index: 3,
        ),
        body: Center(child: Text("Account")));
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          index: 2,
        ),
        body: Center(child: Text("Search")));
  }
}

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

  final _pageOptions = [Search(), HomePage(), Account()];

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
                print("Index" + currentIndex.toString());
              });
            },
            child: Container(
              width: screenWidth(context, dividedBy: 8),
              height: screenWidth(context, dividedBy: 8),
              decoration: BoxDecoration(
                color: currentIndex == 0
                    ? Constants.colors[3]
                    : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                      color: currentIndex == 0
                          ? Colors.grey.withOpacity(0.4) : Colors.transparent)
                ],
              ),
              child: Icon(
                  Icons.person_outline,
                  color: currentIndex == 0 ? Constants.colors[0] : Colors.grey,
                  size:20
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                print("Index" + currentIndex.toString());
                currentIndex = 1;
                push(context, _pageOptions[1]);
              });
            },
            child: Container(
              width: screenWidth(context, dividedBy: 8),
              height: screenWidth(context, dividedBy: 8),
              decoration: BoxDecoration(
                color: currentIndex == 1
                    ? Constants.colors[3]
                    : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                      color: currentIndex == 1
                          ? Colors.grey.withOpacity(0.4) : Colors.transparent)
                ],
              ),
              child: Icon(
                Icons.home,
                color: currentIndex == 1 ? Constants.colors[0] : Colors.grey,
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
                print("Index" + currentIndex.toString());
              });
            },
            child: Container(
              width: screenWidth(context, dividedBy: 8),
              height: screenWidth(context, dividedBy: 8),
              decoration: BoxDecoration(
                color: currentIndex == 2
                    ? Constants.colors[3]
                    : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(2, 2),
                      color: currentIndex == 2
                          ? Colors.grey.withOpacity(0.4) : Colors.transparent)
                ],
              ),
              child: Icon(
                  Icons.history,
                  color: currentIndex == 2 ? Constants.colors[0] : Colors.grey,
                  size:20
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
