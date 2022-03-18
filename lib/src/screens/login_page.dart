import 'dart:convert';

import 'package:delivery_app/src/bloc/delivery_bloc.dart';
import 'package:delivery_app/src/bloc/states.dart';
import 'package:delivery_app/src/models/login_request.dart';
import 'package:delivery_app/src/models/login_response.dart';
import 'package:delivery_app/src/screens/home_page.dart';
import 'package:delivery_app/src/utils/constants.dart';
import 'package:delivery_app/src/utils/utils.dart';
import 'package:delivery_app/src/widgets/build_button.dart';
import 'package:delivery_app/src/widgets/user_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool password = true;
  String token = '';
  int userId = 0;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<LoginResponse> loginRequest(LoginRequest loginRequest) async {
    final prefs = await SharedPreferences.getInstance();
    String apiUrl = "https://gapp.tupperwareoutlet.com/api/login";
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final Map<String, dynamic> body = {
      "email": loginRequest.email,
      "password": loginRequest.password
    };
    var jsonBody = json.encode(body);
    Response response =
        await http.post(Uri.parse(apiUrl), body: jsonBody, headers: headers);
    print("Response ");
    print(response);
    // var jsonResponse = jsonDecode(response.body);
    // print("Response body data productRequest");
    // print(jsonResponse);

    final parsed = json.decode(response.body);
    final data = LoginResponse.fromJson(parsed);
    print("Login response");
    print(data);

    if (response.statusCode == 200) {
      print("Login Successful");
      setState(() {
        prefs.setInt('userId', data.data!.id!);
        prefs.setString('token', data.data!.apiToken!);
        loading = false;
        final int? counter = prefs.getInt('userId');
        print("UserId  " + counter.toString());
      });
      push(context, HomePage());
    } else {
      print(data.message);
      showToast("Please enter valid credentials");
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colors[2],
      body: Container(
        height: screenHeight(context, dividedBy: 1),
        width: screenWidth(context, dividedBy: 1),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      height: screenHeight(context, dividedBy: 2),
                      width: screenWidth(context, dividedBy: 1),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                            Constants.colors[3],
                            Constants.colors[4],
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/reon_tech.png",
                            height: screenHeight(context, dividedBy: 10),
                            width: screenWidth(context, dividedBy: 3),
                          ),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 50),
                          ),
                          const Text("Let's start with Login!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily:"Padauk"
                              ))
                        ],
                      )),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      height: screenHeight(context, dividedBy: 2),
                      width: screenWidth(context, dividedBy: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("I Forgot password?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Constants.colors[6],
                                fontFamily: "Padauk"
                              )),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 40),
                          ),
                          Text("I Don't have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Constants.colors[6],
                                fontFamily:"Padauk"
                              )),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 30),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: screenHeight(context, dividedBy: 2.3),
                  width: screenWidth(context, dividedBy: 1.2),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 30),
                      vertical: screenHeight(context, dividedBy: 30)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight(context, dividedBy: 30),
                      ),
                      UserFormField(
                        textEditingController: emailTextEditingController,
                        label: "Email",
                        prefix: Icon(Icons.email,
                            color: Constants.colors[3], size: 16),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 30),
                      ),
                      UserFormField(
                        textEditingController: passwordTextEditingController,
                        label: "Password",
                        isPassword: password,
                        suffix: Icon(
                            password == false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Constants.colors[1].withOpacity(0.4),
                            size: 16),
                        onTapSuffix: () {
                          setState(() {
                            password = !password;
                          });
                        },
                        prefix: Icon(Icons.lock,
                            color: Constants.colors[3], size: 16),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 30),
                      ),
                      BuildButton(
                        label: "LOGIN",
                        loading: loading,
                        onPressed: () {
                          if (emailTextEditingController.text == '' ||
                              passwordTextEditingController.text == '') {
                            print("Please enter email and password");
                            showToast("Please enter email and password");
                          } else {
                            setState(() {
                              loading = true;
                            });
                            loginRequest(LoginRequest(
                                email: emailTextEditingController.text,
                                password: passwordTextEditingController.text));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
