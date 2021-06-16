import 'package:covid_app/Model/PreventModel.dart';
import 'package:flutter/material.dart';

class Prevent extends StatefulWidget {
  @override
  _PreventState createState() => _PreventState();
}

class _PreventState extends State<Prevent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => ItemList(list[index])));
  }
}

class ItemList extends StatelessWidget {
  PreventModel preventModel;
  ItemList(this.preventModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 150,
          width: 370,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffd4d4e4),
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(3, 3),
              )
            ],
          ),
        ),
        Image(
          image: AssetImage(preventModel.image),
          width: 155,
        ),
        Positioned(
          left: 130,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 136,
            width: MediaQuery.of(context).size.width - 175,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  preventModel.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    preventModel.text,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
