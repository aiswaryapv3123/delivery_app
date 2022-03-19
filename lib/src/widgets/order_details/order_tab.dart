import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({
    Key? key,
  }) : super(key: key);

  @override
  _OrderTabState createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  bool order = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context, dividedBy: 30),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      order = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Ordered Foods",
                        style: TextStyle(
                            fontSize: 16,
                            color: order == false
                                ? Constants.colors[1]
                                : Constants.colors[3],
                            fontFamily: "Padauk",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenWidth(context, dividedBy: 6),
                        child: Divider(
                          thickness: 1.5,
                          color: order == false
                              ? Colors.transparent
                              : Constants.colors[3],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      order = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Customer",
                        style: TextStyle(
                            fontSize: 16,
                            color: order == true
                                ? Constants.colors[1]
                                : Constants.colors[3],
                            fontFamily: "Padauk",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: screenWidth(context, dividedBy: 6),
                        child: Divider(
                          thickness: 1.5,
                          color: order == true
                              ? Colors.transparent
                              : Constants.colors[3],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          order == true
              ? ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: screenWidth(context, dividedBy: 5),
                                  height: screenWidth(context, dividedBy: 5),
                                  color: Colors.white,
                                  child: Image.network(
                                      "https://previews.123rf.com/images/jemastock/jemastock1808/jemastock180802010/112163797-rice-on-bowl-with-chopsticks-vector-illustration-graphic-design.jpg")),
                              SizedBox(
                                width: screenWidth(context, dividedBy: 30),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rice",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Constants.colors[1]
                                            .withOpacity(0.8),
                                        fontFamily: "Padauk",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "1000 g",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: "Padauk",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "\$50.00",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Constants.colors[1]
                                            .withOpacity(0.8),
                                        fontFamily: "Padauk",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "x 0.5",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontFamily: "Padauk",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight(context, dividedBy: 30))
                        ]);
                  },
                )
              : Container()
        ],
      ),
    );
  }
}
