import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

import 'views/category/category_page.dart';
import 'views/class/class_page.dart';
import 'views/courses/courses_page.dart';
import 'views/users/user_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _controller = SideMenuController();
  List<Widget> listWWidget = [
    User_page(),
    Courses_page(),
    Class_page(),
    Category_page()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        controller: _controller,
        backgroundColor: Colors.blueGrey,
        mode: SideMenuMode.open,
        builder: (data) {
          return SideMenuData(
            header: const Text('Mục lục'),
            items: [
              SideMenuItemDataTile(
                isSelected: _currentIndex == 0,
                onTap: () => setState(() => _currentIndex = 0),
                title: 'User',
                hoverColor: Colors.blue,
                titleStyle: const TextStyle(color: Colors.white),
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
              ),
              SideMenuItemDataTile(
                isSelected: _currentIndex == 1,
                onTap: () => setState(() => _currentIndex = 1),
                title: 'Khóa học',
                selectedTitleStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
                icon: const Icon(Icons.book_outlined),
                selectedIcon: const Icon(Icons.book),
              ),
              SideMenuItemDataTile(
                isSelected: _currentIndex == 2,
                onTap: () => setState(() => _currentIndex = 2),
                title: 'Lớp',
                icon: const Icon(Icons.calculate_outlined),
                selectedIcon: const Icon(Icons.calculate),
              ),
              SideMenuItemDataTile(
                isSelected: _currentIndex == 3,
                onTap: () => setState(() => _currentIndex = 3),
                title: 'Danh mục',
                icon: const Icon(Icons.category_outlined),
                selectedIcon: const Icon(Icons.category),
              ),
            ],
            footer: const Text('Footer'),
          );
        },
      ),
      appBar: AppBar(
        title: Text("sEdu"),
      ),
      body: Container(child: listWWidget[_currentIndex]),
    );
  }
}
