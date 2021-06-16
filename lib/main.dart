import 'package:covid_app/screens/Detail.dart';
import 'package:covid_app/screens/HomePage.dart';
import 'package:covid_app/widgets/ClassBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.promptTextTheme()),
      home: Drawer(),
    );
  }
}


class Drawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('รายงานสถานการณ์',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: SvgPicture.asset("assets/statistics.svg",
              height: 25, width: 25, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'อาการและการป้องกัน',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: SvgPicture.asset("assets/writing.svg",
              height: 25, width: 25, color: Colors.white),
          page: Detail(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 0.1),
                      image: DecorationImage(
                          image: AssetImage('assets/doctor.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('ศริญญาภรณ์   นาคศิลา',
                        style:
                        new TextStyle(fontSize: 17, color: Colors.white)),
                    new SizedBox(height: 5),
                    new Text('x-xxxx-xxxxx-x-xx',
                        style:
                        new TextStyle(fontSize: 15, color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.login, color: Colors.white),
        ),
        decoration: BoxDecoration(color: Color(0xff070e50)),
      ),
    );
  }
}
