import 'dart:convert';

import 'package:covid_app/Model/CovidModel.dart';
import 'package:covid_app/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'package:http/http.dart' as http;

class Home extends KFDrawerContent {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Covid19 _datacovid19;
  bool isDrawerOpen = false;

  void initState() {
    super.initState();
    getAPI();
  }

  Future<void> getAPI() async {
    var url = Uri.parse(
        'https://covid19.th-stat.com/json/covid19v2/getTodayCases.json');
    var response = await http.get(url);

    print(response.body);
    setState(() {
      _datacovid19 = covid19FromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffffffe),
      ),
      child: SafeArea(
        child: ListView(
          children: <Widget>[
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
                          )),
                    ),
                    Spacer(),
                    Container(
                      height: 45,
                      width: 45,
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
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "รายงานสถานการณ์ Covid - 19",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "อัพเดทล่าสุด",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${_datacovid19?.updateDate}",
                              style: TextStyle(
                                fontSize: 18.5,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 155,
                              width: 360,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFF544DF3),
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    spreadRadius: 0,
                                    offset: Offset(3, 3),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ติดเชื้อสะสม",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${_datacovid19?.confirmed}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "[ + ${_datacovid19?.newConfirmed} ]",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 105,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3caea3),
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                          offset: Offset(3, 3),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "หายแล้ว",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${_datacovid19?.recovered}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "[ + ${_datacovid19?.newRecovered} ]",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 105,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF4AC3A),
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                          offset: Offset(3, 3),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "รักษาอยู่",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${_datacovid19?.hospitalized}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 105,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEA4A5A),
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                          offset: Offset(3, 3),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "เสียชีวิต",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${_datacovid19?.deaths}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "[ + ${_datacovid19?.newDeaths} ]",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "จำแนกตามกลุ่มอายุ",
                                    style: TextStyle(
                                      fontSize: 21,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.people_alt_sharp,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Chart(),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 28),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'อัพเดทข้อมูลล่าสุดวันที่ 25 เมษายน 2564',
                                    style: TextStyle(
                                      color: Color(0xFFD4192B),
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      )
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
