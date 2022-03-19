import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class DeliveryAppBar extends StatefulWidget {
  final String? title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Function? onTapLeftIcon;
  final Function? onTapRightIcon;
  final bool profile;
  const DeliveryAppBar(
      {Key? key,
      this.title,
      this.rightIcon,
      this.leftIcon,
      this.onTapLeftIcon,
      this.onTapRightIcon,
      this.profile = false})
      : super(key: key);

  @override
  _DeliveryAppBarState createState() => _DeliveryAppBarState();
}

class _DeliveryAppBarState extends State<DeliveryAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      height: screenHeight(context, dividedBy: 15),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, dividedBy: 30),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.leftIcon != null)
            GestureDetector(
              onTap: () {
                widget.onTapLeftIcon!();
              },
              child: widget.leftIcon,
            ),
          Spacer(),
          if (widget.title != null)
            Text(
              widget.title!,
              style: TextStyle(
                  fontSize: 16,
                  color: widget.profile ==true? Colors.white: Constants.colors[3],
                  fontFamily: "Padauk",
                  fontWeight: FontWeight.bold),
            ),
          Spacer(),
          if (widget.rightIcon != null)
            GestureDetector(
              onTap: () {
                widget.onTapRightIcon!();
              },
              child: widget.rightIcon,
            ),
        ],
      ),
    );
  }
}
