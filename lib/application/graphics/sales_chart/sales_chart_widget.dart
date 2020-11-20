import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:graficos/application/graphics/sales_chart/sales_chart_entity.dart';

class SalesChartWidget extends StatefulWidget {
  final double chartSize;
  final List<Map<String, dynamic>> listaData;

  const SalesChartWidget({
    Key key,
    @required this.chartSize,
    @required this.listaData,
  })  : assert(listaData.length <= 10),
        super(key: key);

  @override
  _SalesChartWidgetState createState() => _SalesChartWidgetState();
}

class _SalesChartWidgetState extends State<SalesChartWidget> {
  List<charts.Series> seriesList;

  @override
  void initState() {
    seriesList = [
      new charts.Series<SalesChartEntity, int>(
        id: 'Sales',
        domainFn: (SalesChartEntity sales, _) => sales.year,
        measureFn: (SalesChartEntity sales, _) => sales.sales,
        data: widget.listaData.map((e) {
          return SalesChartEntity(
            e["year"],
            e["sales"],
            e["label"],
            e["color"],
          );
        }).toList(),
        colorFn: (SalesChartEntity sales, _) => sales.color,
        labelAccessorFn: (SalesChartEntity row, _) => '${row.sales}%',
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: widget.chartSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              // color: Colors.red,
              alignment: Alignment.center,
              child: charts.PieChart(
                seriesList,
                defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 40,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.inside,
                      leaderLineColor: charts.ColorUtil.fromDartColor(Colors.red),
                      showLeaderLines: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                // verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    child: Text(
                      "Legenda",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 25,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.listaData.length,
                          itemBuilder: (context, i) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    color: widget.listaData[i]["color"],
                                    height: 10,
                                    width: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${widget.listaData[i]["sales"].toString()} - ${widget.listaData[i]["label"].toString()}",
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
