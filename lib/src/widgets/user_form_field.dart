import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class UserFormField extends StatefulWidget {
  const UserFormField({
    Key? key,
    required this.label,
    required this.textEditingController,
    this.isNumber = false,
    this.isPassword = false,
    this.suffix,
    this.prefix,
    this.onTapSuffix,
  }) : super(key: key);
  final String label;
  final TextEditingController textEditingController;
  final bool isNumber;
  final bool isPassword;
  final Widget? suffix;
  final Widget? prefix;
  final Function? onTapSuffix;

  @override
  _UserFormFieldState createState() => _UserFormFieldState();
}

class _UserFormFieldState extends State<UserFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context, dividedBy: 16),
      child: TextField(
        controller: widget.textEditingController,
        obscureText: widget.isPassword == true ? true : false,
        cursorColor: Constants.colors[3],
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        style: TextStyle(
            fontSize: 14,
            fontFamily: "Padauk",
            fontWeight: FontWeight.w400,
            color: Constants.colors[3],),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.label,
          labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: "Padauk",
              fontWeight: FontWeight.w400,
              color: Constants.colors[1]),
          contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 50),
              vertical: screenHeight(context, dividedBy: 120)),
          prefixIcon: widget.prefix ?? SizedBox(
            width: screenWidth(context, dividedBy: 50),
            height: screenWidth(context, dividedBy: 50),
          ),
          suffixIcon: GestureDetector(
              onTap: (){
                widget.onTapSuffix!() ?? setState((){});
              },
              child: widget.suffix
                  ?? SizedBox(
                      width: screenWidth(context, dividedBy: 50),
                      height: screenWidth(context, dividedBy: 50),
                    ),),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Constants.colors[1].withOpacity(0.1), width: 0.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Constants.colors[1].withOpacity(0.1), width: 0.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
