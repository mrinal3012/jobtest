import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:jobtest/user/user_page.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  bool input = true;
  int localValue = 0;

  void login(String email, password) async {
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        localValue = response.statusCode;
        print(
            "all is right......................................................");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserPage(),
        ));
      } else {
        input = false;
        print("nothing ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
      }
    } catch (value) {
      print(value.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: input == true
                              ? SvgPicture.asset("images/undraw.svg")
                              : SvgPicture.asset("images/undraw2.svg"),
                        )),
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 5,
                                child: Text(
                                  "Login Details",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )),
                            Expanded(
                                flex: 5,
                                child: Form(
                                  key: _formkey,
                                  child: Container(
                                      child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == localValue) {
                                      } else {
                                        return "Please enter valid email!";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText:
                                            "Username,email & phone number",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  )),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(child: TextFormField(controller: passwordController, decoration: InputDecoration(
                                      hintText: "Password", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                                ))),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Forgot Password,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff635C5C),
                                      fontWeight: FontWeight.w600),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: MaterialButton(
                                    color: input == true
                                        ? Color(0xff0B6EFE)
                                        : Color(0xff0B6EFE).withOpacity(.5),
                                    minWidth: double.infinity,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onPressed: () {
                                      login(emailController.text.toString(),
                                          passwordController.text.toString());
                                      if (_formkey.currentState!.validate()) {
                                        print("succesful");
                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(),));
                                      } else {
                                        input = false;
                                        setState(() {});
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: input == true
                                          ? TextStyle(
                                              fontSize: 24,
                                              color: Color(0xffFFFFFF),
                                              fontWeight: FontWeight.w700)
                                          : TextStyle(
                                              fontSize: 24,
                                              color: Color(0xffFFFFFF)
                                                  .withOpacity(.5),
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    SvgPicture.asset("images/rectangle 29.svg"),
                                    Text("SingUp"),
                                    SvgPicture.asset("images/rectangle 30.svg")
                                  ],
                                )),
                          ],
                        )),
                  ]),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/vector.png"),
                  )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                    color: Color(0xffECE9EC),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: SvgPicture.asset("images/google.svg"),
                                ))),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                    color: Color(0xffECE9EC),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child:
                                      SvgPicture.asset("images/facebook.svg"),
                                ))),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                    color: Color(0xffECE9EC),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: SvgPicture.asset("images/google.svg"),
                                ))),
                          ]),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
