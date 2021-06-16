import 'package:flutter/material.dart';

class SymptonsModel {
  String image;
  String title;
  Color colorr;

  SymptonsModel({this.image, this.title, this.colorr});
}

List<SymptonsModel> list = [
  SymptonsModel(
    image: 'assets/fever.png',
    title: 'มีไข้',
    colorr: Color(0xFF544DF3),
  ),
  SymptonsModel(
    image: 'assets/cough.png',
    title: 'ไอแห้ง',
    colorr: Color(0xFFEA4A5A),
  ),
  SymptonsModel(
    image: 'assets/sore_throat.png',
    title: 'เจ็บคอ',
    colorr: Color(0xFFF4AC3A),
  ),
  SymptonsModel(
    image: 'assets/headache.png',
    title: 'ปวดศีรษะ',
    colorr: Color(0xFF3caea3),
  ),
];
