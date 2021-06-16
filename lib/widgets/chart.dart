import 'package:covid_app/Model/PieData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: AspectRatio(
          aspectRatio: 1.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
              elevation: 20,
              shadowColor: Colors.grey,
              color: Color(0xE4E8F3EE),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                            pieTouchData:
                                PieTouchData(touchCallback: (pieTouchResponse) {
                              setState(() {
                                final desiredTouch = pieTouchResponse.touchInput
                                        is! PointerExitEvent &&
                                    pieTouchResponse.touchInput
                                        is! PointerUpEvent;
                                if (desiredTouch &&
                                    pieTouchResponse.touchedSection != null) {
                                  touchedIndex = pieTouchResponse
                                      .touchedSection.touchedSectionIndex;
                                } else {
                                  touchedIndex = -1;
                                }
                              });
                            }),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: getSections(touchedIndex)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: PieData.data
                        .map(
                          (data) => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: buildIndicator(
                                color: data.color,
                                text: data.age,
                                // isSquare: true,
                              )),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  List<PieChartSectionData> getSections(int touchedIndex) => PieData.data
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        final isTouched = index == touchedIndex;
        final double fontSize = isTouched ? 20 : 14;
        final double radius = isTouched ? 100 : 75;
        final value = PieChartSectionData(
          color: data.color,
          value: data.number,
          title: '${data.number.toString()}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
            color: const Color(0xffffffff),
          ),
        );

        return MapEntry(index, value);
      })
      .values
      .toList();

  Widget buildIndicator({
    @required Color color,
    @required String text,
    bool isSquare = false,
    double size = 13,
    Color textColor = const Color(0xff505050),
  }) =>
      Row(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          )
        ],
      );
}
