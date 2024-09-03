import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartModel {
  ChartModel({
    required this.xAxisProperty,
    required this.yAxisProperty,
  });

  final String xAxisProperty;
  final double yAxisProperty;
}

class ColumnChartWidget extends StatefulWidget {
  const ColumnChartWidget({
    super.key,
    required this.data,
    this.animationDuration,
  });

  final List<ChartModel> data;
  final double? animationDuration;

  @override
  State<ColumnChartWidget> createState() => _ColumnChartWidgetState();
}

class _ColumnChartWidgetState extends State<ColumnChartWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return SfCartesianChart(
        primaryYAxis: NumericAxis(
          labelStyle: context.tt.bodyMedium,
        ),
        primaryXAxis: CategoryAxis(
          labelStyle: context.tt.titleMedium,
        ),
        series: <CartesianSeries<ChartModel, String>>[
          ColumnSeries<ChartModel, String>(
            width: 0.3,
            animationDuration: widget.animationDuration ?? 1500,
            color: context.cs.primary,
            dataSource: widget.data,
            xValueMapper: (ChartModel xAxis, index) =>
            // TODO : we have to find another way of (index + 1) to 
            // TODO : differentiate between elements that have the same xValue 
                '${index + 1} ${xAxis.xAxisProperty.replaceAll('"', '')}',
            yValueMapper: (ChartModel yAxis, index) => yAxis.yAxisProperty,
          ),
        ],
      );
    } else {
      return const SfCartesianChart();
    }
  }
}
