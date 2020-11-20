import 'package:flutter/material.dart';
import 'package:graficos/application/graphics/sales_chart/sales_chart_widget.dart';

List<Map<String, dynamic>> lista = [
  {
    "year": 00,
    "sales": 10,
    "label": "label 1 label 1 label 1 label 1 label 1 label 1 label 1 label 1 ",
    "color": Colors.purple
  },
  {"year": 01, "sales": 10, "label": "label 2", "color": Colors.blue},
  {"year": 02, "sales": 10, "label": "label 3", "color": Colors.yellow},
  {"year": 03, "sales": 10, "label": "label 4", "color": Colors.green},
  {"year": 04, "sales": 10, "label": "label 4", "color": Colors.orange},
  {"year": 05, "sales": 10, "label": "label 4", "color": Colors.pink},
  // {"year": 06, "sales": 10, "label": "label 4", "color": Colors.grey},
  // {"year": 07, "sales": 10, "label": "label 4", "color": Colors.black},
  // {"year": 08, "sales": 10, "label": "label 4", "color": Colors.brown},
  // {"year": 09, "sales": 10, "label": "label 4", "color": Colors.orangeAccent},
  // {"year": 10, "sales": 10, "label": "label 4", "color": Colors.blueGrey},
  // {"year": 11, "sales": 10, "label": "label 4", "color": Colors.greenAccent},
  // {"year": 12, "sales": 10, "label": "label 4", "color": Colors.amber},
];

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Gráficos"),
      ),
      body: SalesChartWidget(
        chartSize: 180,
        listaData: lista,
      ),
    );
  }
}
