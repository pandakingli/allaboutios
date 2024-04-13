
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/pagehome.dart';
import 'package:my_flutter/pageinfo.dart';
import 'package:my_flutter/pagelist.dart';
import 'package:my_flutter/pagemine.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {

  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.blue,label:"首页"),
    const BottomNavigationBarItem(icon: Icon(Icons.list),backgroundColor: Colors.blue,label:"列表"),
    const BottomNavigationBarItem(icon: Icon(Icons.message),backgroundColor: Colors.blue,label:"消息"),
    const BottomNavigationBarItem(icon: Icon(Icons.person),backgroundColor: Colors.blue,label:"我的"),
  ];

 int currentPageIndex = 0;
final pages = [const PageHome(),const PageList(),const PageInfo(),const PageMine()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("底部导航栏"),),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _selectPage(index);
        },
      ),
      body: pages[currentPageIndex],
    );
  }

  void _selectPage(int index) {
    if(index != currentPageIndex) {
      setState(() {
        currentPageIndex = index;
      });
    }
  }
}