import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/features/presentation/widgets/app_button.dart';
import 'package:flutter_template/features/presentation/widgets/app_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late AssetImage logo;
  late DateTime currentBackPressTime;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final secureStorage = new FlutterSecureStorage();
  bool rememberStatus = true;
  String token = '';

  @override
  void initState() {
    super.initState();
    // getToken();
  }

  getToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint(fcmToken);
    setState(() {
      token = fcmToken ?? "";
    });
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: padding.top,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      AppTextField(
                          hintText: "Email Address",
                          keyboardType: TextInputType.emailAddress,
                          controller: _usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email can\'t be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 3.h,
                      ),
                      AppTextField(
                          hintText: "Password",
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 3.h,
                      ),
                      AppButton(
                        onTapButton: () {},
                        buttonText: "SIGN IN",
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          text: TextSpan(
                            text: "Forgot Password? ",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              fontSize: 15,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Reset',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
