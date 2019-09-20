import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.light));
    return Stack(
      children: <Widget>[
        ClipPath(
              clipper: TitleClipper(),
              child: Container(height: 250,color: Colors.blue,),
            ),
        Scaffold(
          backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  title: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("生涯",style: TextStyle(color: Colors.white),),
                        Row(children: <Widget>[
                            GestureDetector(
                              child: Icon(Icons.language),
                              onTap: (){},
                            ),
                            SizedBox(width: 20,),
                            GestureDetector(
                              child: Icon(Icons.settings),
                              onTap: (){},
                            ),
                        ],)
                      ],
                    ),
                  )
                )
              ],
            )
        )
      ],
    );
  }
}
//贝塞尔曲线
class TitleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0.0, size.height-30);
    var firstControllPoint = Offset(size.width/4,size.height);
    var firstPoint = Offset(size.width/2,size.height);
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy, firstPoint.dx,firstPoint.dy);
    var secondControllPoint = Offset(size.width-(size.width/4),size.height);
    var secondPoint = Offset(size.width,size.height-30);
    path.quadraticBezierTo(secondControllPoint.dx, secondControllPoint.dy, secondPoint.dx,secondPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}

