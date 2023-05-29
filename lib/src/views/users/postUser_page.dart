import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sedu_web_flutter/src/model/otd/users/postUser.otd.dart';

import '../../controller/users/postUser.controller.dart';

class PostUser_page extends StatefulWidget {
  const PostUser_page({super.key});

  @override
  State<PostUser_page> createState() => _PostUser_pageState();
}

class _PostUser_pageState extends State<PostUser_page> {
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

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  TextEditingController _txtAvatar = TextEditingController();
  TextEditingController _txtBirthday = TextEditingController();
  DateTime birthday = DateTime.now();
  Uint8List? _pickImage;
  String _image = '';
  PostUserController? _postUserController;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        _pickImage = f;
        _image = image.path;
      });
      print(_pickImage);
      print(_image);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postUserController = PostUserController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                  "Thêm user",
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtName,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Tên user",
                border: OutlineInputBorder(),
                hintText: "Tên user",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtEmail,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Email",
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtPhone,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Số điện thoại",
                border: OutlineInputBorder(),
                hintText: "Số điện thoại",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _txtBirthday,
              onTap: () async {
                DateTime? datimePicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (datimePicker != null) {
                  setState(() {
                    birthday = datimePicker;
                    _txtBirthday.text =
                        DateFormat('dd/MM/yyyy').format(datimePicker);
                  });
                }
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: "Ngày sinh",
                border: OutlineInputBorder(),
                hintText: "Ngày sinh",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: _pickImage == null
                  ? InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: DottedBorder(
                        color: const Color.fromRGBO(48, 48, 48, 1),
                        dashPattern: const [10],
                        child: Center(
                          child: Text(
                            "Chọn hình ảnh",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.8)),
                          ),
                        ),
                      ),
                    )
                  : Image.memory(_pickImage!),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                isEmail(_txtEmail.text) && int.parse(_txtPhone.text) == 10
                    ? _postUserController!
                        .postUser(PostUserOtd(
                            name: _txtName.text,
                            email: _txtEmail.text,
                            phone: _txtPhone.text,
                            avatarUrl: _image,
                            birthday: birthday))
                        .then((value) {
                        Navigator.pop(context);
                      })
                    : print('Error register');
              },
              child: Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(23, 161, 250, 1)),
                child: Text(
                  "Thêm",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
