import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/login_register/login.controller.dart';
import '../../myHome_page.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPass = TextEditingController();
  LoginController? _loginController;
  bool isEmail(String string) {
    // Null or empty string is invalid
    if (string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginController = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          //padding: EdgeInsets.symmetric(vertical: 150),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset('images/logo__image.png')),
                Column(
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(23, 161, 250, 1)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _txtEmail,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(
                                        23, 161, 250, 1)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(23, 161, 250, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Email",
                              border: const OutlineInputBorder(),
                              hintText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _txtPass,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(
                                        23, 161, 250, 1)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(23, 161, 250, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Password",
                              border: const OutlineInputBorder(),
                              hintText: "Password",
                            ),
                            //keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        isEmail(_txtEmail.text) && _txtPass.text == 'admin'
                            ? _loginController!
                                .login(_txtEmail.text)
                                .then((value) {
                                if (value != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage()));
                                } else {
                                  print('Error');
                                }
                              })
                            : print("Error email");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(23, 161, 250, 1)),
                        child: Text(
                          "Đăng nhập",
                          style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
