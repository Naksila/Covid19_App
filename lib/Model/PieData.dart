import 'package:flutter/material.dart';

class Data {
  String age;
  double number;
  Color color;

  Data({this.age, this.color, this.number});
}

class PieData {
  static List<Data> data = [
    Data(age: '0-9 ปี', number: 2.6, color: Color(0xff93f197)),
    Data(age: '10-19 ปี', number: 5.0, color: Color(0xFFfbc376)),
    Data(age: '20-29 ปี', number: 40.0, color: Color(0xFFDE3D4C)),
    Data(age: '30-39 ปี', number: 24.2, color: Color(0xfff8928d)),
    Data(age: '40-49 ปี', number: 11.7, color: Color(0xFF3c59c1)),
    Data(age: '50-59 ปี', number: 6.3, color: Color(0xff231b54)),
    Data(age: '60-69 ปี', number: 3.1, color: Color(0xFF2ebbaa)),
    Data(age: '70 ปีขึ้นไป', number: 1.5, color: Color(0xFF24a5e7)),
    Data(age: 'ไม่ระบุ', number: 5.6, color: Color(0xffc2c9c8)),
  ];
}
