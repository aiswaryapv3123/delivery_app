import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  final bool loading;
  const BuildButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.loading = false})
      : super(key: key);

  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 10),
            vertical: screenHeight(context, dividedBy: 50)),
        decoration: BoxDecoration(
            color: Constants.colors[3],
            borderRadius: BorderRadius.circular(20)),
        child: widget.loading == true
            ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            )
            : Text(widget.label,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontFamily: "Padauk",
                    fontWeight: FontWeight.w700)),
      ),
    );
  }
}
