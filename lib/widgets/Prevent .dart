import 'package:covid_app/Model/PreventModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Container(
        height: 160,
        width: 360,
        margin: EdgeInsets.only(bottom: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Card(
            elevation: 15,
            color: Colors.white,
            shadowColor: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(preventModel.image),
                  width: 140,
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: MediaQuery.of(context).size.width - 188,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        preventModel.title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        preventModel.text,
                        maxLines: 4,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

