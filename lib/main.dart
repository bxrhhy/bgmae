import 'package:bgame/pages/ActivityPages/activity_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  //body的页面列表
  List<Widget> _bodyList =[
    ActivityPage(),
    Center(child: Text("赛区"),),
    Center(child: Text("入场券"),),
    Center(child: Text("广场"),),
    Center(child: Text("商城"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyList[_currentPage],
      //底部导航栏,至少需要三个
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
        highlightColor: Colors.white,
        splashColor: Colors.white
      ),
          child: BottomNavigationBar(
              elevation: 0.5,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentPage,
              onTap: (index){
                _currentPage = index;
                setState((){});
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset("images/career_active.svg",width: 30,),
                  icon: SvgPicture.asset("images/career.svg",width: 20),
                  title: _currentPage == 0?Container():Text("生涯")
                ),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("images/activity_active.svg",width: 30),
                    icon: SvgPicture.asset("images/activity.svg",width: 20),
                    title: _currentPage == 1?Container():Text("赛区")
                ),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("images/ticket_active.svg",width: 30),
                    icon: SvgPicture.asset("images/ticket.svg",width: 20),
                    title: _currentPage == 2?Container():Text("入场券")
                ),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("images/community_active.svg",width: 30),
                    icon: SvgPicture.asset("images/community.svg",width: 20),
                    title: _currentPage == 3?Container():Text("广场")
                ),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset("images/mall_active.svg",width: 30),
                    icon: SvgPicture.asset("images/mall.svg",width: 20,fit: BoxFit.cover,),
                    title: _currentPage == 4?Container():Text("商城")
                )
              ]
          ),
      ),
    );
  }
}
