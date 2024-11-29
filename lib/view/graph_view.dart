import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/order_view_model.dart';

class GraphView extends StatelessWidget {
  const GraphView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<OrderViewModel>(
      context,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF466EF9).withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //title
              Text(
                '2021 Orders per Month'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              //space
              const SizedBox(
                height: 30,
              ),
              //graph
              Expanded(
                child: BarChart(
                  BarChartData(
                    gridData:
                        const FlGridData(show: false, drawVerticalLine: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        axisNameSize: 20,
                        axisNameWidget: Text('Number of Orders',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color:
                                    const Color(0xFF466EFA).withOpacity(0.6))),
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 35,
                          getTitlesWidget: (value, meta) {
                            return Text(value.toInt().toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF466EFA)));
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        axisNameSize: 20,
                        axisNameWidget: Text('Months',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color:
                                    const Color(0xFF466EFA).withOpacity(0.6))),
                        sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 20,
                            getTitlesWidget: (value, meta) {
                              return Text(value.toInt().toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF466EFA)));
                            }),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    minY: 0,
                    maxY: double.parse(viewModel.orders.length.toString()),
                    barGroups: viewModel.sortedByKeyMap.entries
                        .map(
                          (entry) => BarChartGroupData(x: entry.key, barRods: [
                            BarChartRodData(
                                toY: entry.value,
                                borderRadius: BorderRadius.zero,
                                color: const Color(0xFF466EF9))
                          ]),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
