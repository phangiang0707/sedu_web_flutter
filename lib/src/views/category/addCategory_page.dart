import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/category/postCategory.controller.dart';

class AddCategory_page extends StatefulWidget {
  const AddCategory_page({super.key});

  @override
  State<AddCategory_page> createState() => _AddCategory_pageState();
}

class _AddCategory_pageState extends State<AddCategory_page> {
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtDescription = TextEditingController();
  PostCategoryControllerr? _postCategoryControllerr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postCategoryControllerr = PostCategoryControllerr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 500,
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context, 'refresh');
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    Text(
                      "Danh mục",
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
                    labelText: "Tên danh mục",
                    border: OutlineInputBorder(),
                    hintText: "Tên danh mục",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _txtDescription,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(23, 161, 250, 1)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Miêu tả",
                    border: OutlineInputBorder(),
                    hintText: "Miêu tả",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _postCategoryControllerr!
                        .postCategory(_txtName.text, _txtDescription.text)
                        .then((value) {
                      if (value != null) {
                        Navigator.pop(context, 'refresh');
                      } else {
                        print('Error');
                      }
                    });
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
        ),
      ),
    );
  }
}
