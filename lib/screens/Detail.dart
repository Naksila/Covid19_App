import 'package:covid_app/widgets/Prevent%20.dart';
import 'package:covid_app/widgets/Symptoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Detail extends KFDrawerContent {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffffffe),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      child: Material(
                        shadowColor: Colors.transparent,
                        color: Colors.transparent,
                        child: IconButton(
                          icon: SvgPicture.asset('assets/menu.svg',
                              height: 20, width: 20, color: Colors.black),
                          onPressed: widget.onMenuPressed,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 0.1),
                          image: DecorationImage(
                              image: AssetImage('assets/doctor.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "COVID-19",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF3C2146)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "โควิด-19 ส่งผลต่อผู้คนในรูปแบบที่แตกต่างกันไป\nผู้ที่ติดเชื้อส่วนใหญ่จะมีอาการเล็กน้อยถึงปานกลาง\nและหายจากโรคได้เองโดยไม่ต้องเข้ารักษาในโรงพยาบาล\n",
                            maxLines: 20,
                            style: TextStyle(
                                fontSize: 14.5, color: Color(0xFF3C2146)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "อาการเบื้องต้น",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF3C2146)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Symptoms(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "การป้องกัน",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF3C2146)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Prevent(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
