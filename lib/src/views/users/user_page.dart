import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/users/getUser.controller.dart';
import '../../model/otd/users/user.otd.dart';
import '../../utils/url.dart';
import 'postUser_page.dart';

class User_page extends StatefulWidget {
  const User_page({super.key});

  @override
  State<User_page> createState() => _User_pageState();
}

class _User_pageState extends State<User_page> {
  GetUserController? _getUserController;
  List<UserOtd>? _userOtd;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    _getUserController = GetUserController();
    super.initState();
    _getUserController!.getUser().then((value) {
      setState(() {
        _userOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Center(
            child: Container(
              width: 500,
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  _getUserController!.getUser().then((value) {
                    setState(() {
                      _userOtd = value;
                    });
                  });
                },
                child: Column(
                  children: [
                    Text(
                      "User",
                      style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () async {
                              String refresh = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostUser_page()));
                              if (refresh == 'refresh') {
                                _refreshIndicatorKey.currentState?.show();
                              }
                            },
                            child: Text(
                              "Thêm user",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                            )),
                        TextButton(
                            onPressed: () {
                              _refreshIndicatorKey.currentState?.show();
                            },
                            child: Text("Tải lại",
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 161, 250, 1))))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _userOtd != null
                        ? Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: _userOtd!
                                    .map((e) => Container(
                                              width: 500,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipOval(
                                                          child:
                                                              //  widget.userOtd.avatarUrl != null
                                                              //     ? Image(
                                                              //         image:
                                                              //             NetworkImage('${url}${widget.userOtd.avatarUrl}'))
                                                              //     :
                                                              Image.asset(
                                                        'images/logo__image.png',
                                                        height: 20,
                                                        width: 20,
                                                      )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "${e.name}",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.5)),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 235, 211, 0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        23,
                                                                        161,
                                                                        250,
                                                                        1),
                                                                blurRadius: 2,
                                                                spreadRadius: 1,
                                                                offset: Offset(
                                                                    2, 1))
                                                          ]),
                                                      child: Text(
                                                        "Sửa",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                        // ContainerUser(
                                        //       userOtd: e,
                                        //     )
                                        )
                                    .toList(),
                              ),
                            ),
                          )
                        : CircularProgressIndicator()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class ContainerUser extends StatefulWidget {
//   const ContainerUser({super.key, required this.userOtd});
//   final UserOtd userOtd;
//   @override
//   State<ContainerUser> createState() => _ContainerUserState();
// }

// class _ContainerUserState extends State<ContainerUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 500,
//       margin: EdgeInsets.only(bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               ClipOval(
//                   child:
//                       //  widget.userOtd.avatarUrl != null
//                       //     ? Image(
//                       //         image:
//                       //             NetworkImage('${url}${widget.userOtd.avatarUrl}'))
//                       //     :
//                       Image.asset(
//                 'images/logo__image.png',
//                 height: 20,
//                 width: 20,
//               )),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 "${widget.userOtd.name}",
//                 style: GoogleFonts.inter(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(0, 0, 0, 0.5)),
//               ),
//             ],
//           ),
//           InkWell(
//             onTap: () {},
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//               decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 235, 211, 0),
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Color.fromRGBO(23, 161, 250, 1),
//                         blurRadius: 2,
//                         spreadRadius: 1,
//                         offset: Offset(2, 1))
//                   ]),
//               child: Text(
//                 "Sửa",
//                 style: GoogleFonts.inter(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
