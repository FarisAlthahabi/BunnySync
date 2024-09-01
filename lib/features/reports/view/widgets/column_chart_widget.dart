import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChartModel {
  ColumnChartModel({
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

  final List<ColumnChartModel> data;
  final double? animationDuration;

  @override
  State<ColumnChartWidget> createState() => _ColumnChartWidgetState();
}

class _ColumnChartWidgetState extends State<ColumnChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis: NumericAxis(
        labelStyle: context.tt.bodyMedium,
      ),
      primaryXAxis: CategoryAxis(
        labelStyle: context.tt.titleMedium,
      ),
      series: <CartesianSeries<ColumnChartModel, String>>[
        ColumnSeries<ColumnChartModel, String>(
          width: 0.3,
          animationDuration: widget.animationDuration ?? 1500,
          color: context.cs.primary,
          dataSource: widget.data,
          xValueMapper: (ColumnChartModel xAxis, index) =>
              '${index + 1} ${xAxis.xAxisProperty.replaceAll('"', '')}',
          yValueMapper: (ColumnChartModel yAxis, index) => yAxis.yAxisProperty,
        ),
      ],
    );
  }
}
