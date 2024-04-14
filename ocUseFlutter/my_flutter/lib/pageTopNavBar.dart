import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageTopNavBar extends StatefulWidget {
  const PageTopNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _PageTopNavBarState();
}

class _PageTopNavBarState extends State<PageTopNavBar> with SingleTickerProviderStateMixin {
  final List<Tab> _topTabs = <Tab>[ const Tab(text: "首页",icon: Icon(Icons.face)),
                                    const Tab(text: "财富",icon: Icon(Icons.wallet)),
                                    const Tab(text: "新闻",icon: Icon(Icons.inbox)),
                                    const Tab(text: "水果",icon: Icon(Icons.mouse)),
                                    const Tab(text: "其他",icon: Icon(Icons.more))
  ];

  //

  dynamic _myTabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myTabController = TabController(length: _topTabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("顶部导航栏"),
        centerTitle: true,
        bottom: TabBar(
            tabs: _topTabs,
          controller: _myTabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
          controller: _myTabController,
          children: _topTabs.map((Tab item) { return Text(item.text?? "null");}).toList(),
      ),
    );
  }

  /*
  // MaterialApp-DefaultTabController-appBar body 层级关系
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: _topTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("顶部导航栏"),
            bottom: TabBar(tabs: _topTabs, isScrollable: true,),
          ),
          body: TabBarView(
            children: _topTabs.map((Tab item)  {
            return Text(item.text?? "null");
          }).toList()),
        ),
      ),
    );
  }
*/
}