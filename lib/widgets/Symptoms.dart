import 'package:covid_app/Model/SymptomsModel.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.9,
      child:ListView.builder(
           itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>ItemList(list[index])
      )
    );

  }
}
class ItemList extends StatelessWidget {
  SymptonsModel symptonsModel;
  ItemList(this.symptonsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 150,
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(25)),
        child: Card(
          elevation: 15,
          shadowColor: symptonsModel.colorr,
          color: symptonsModel.colorr,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(symptonsModel.image),
                width: 60,
                height: 60,
              ),
              SizedBox(
                height: 10,
              ),
              Text(symptonsModel.title,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
