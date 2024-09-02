import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({
    super.key,
    required this.data,
    this.animationDuration,
  });

  final List<ChartModel> data;
  final double? animationDuration;

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis: NumericAxis(
        labelStyle: context.tt.bodyMedium,
      ),
      primaryXAxis: CategoryAxis(
        labelStyle: context.tt.titleMedium,
      ),
      series: <CartesianSeries<ChartModel, String>>[
        LineSeries<ChartModel, String>(
          width: 3,
          animationDuration: widget.animationDuration ?? 1500,
          color: context.cs.primary,
          dataSource: widget.data,
          xValueMapper: (ChartModel xAxis, index) =>
              '${index + 1} ${xAxis.xAxisProperty.replaceAll('"', '')}',
          yValueMapper: (ChartModel yAxis, index) => yAxis.yAxisProperty,
        ),
      ],
    );
  }
}
