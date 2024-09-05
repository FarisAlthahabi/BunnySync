import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartModel {
  ChartModel({
    required this.xAxisProperty,
    required this.yAxisProperty,
  });

  final String xAxisProperty;
  final List<double> yAxisProperty;
}

class ColumnChartWidget extends StatefulWidget {
  const ColumnChartWidget({
    super.key,
    required this.data,
    this.animationDuration,
    this.columnColor,
  });

  final List<ChartModel> data;
  final double? animationDuration;
  final List<Color?>? columnColor;

  @override
  State<ColumnChartWidget> createState() => _ColumnChartWidgetState();
}

class _ColumnChartWidgetState extends State<ColumnChartWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return Skeleton.replace(
        child: SfCartesianChart(
          primaryYAxis: NumericAxis(
            labelStyle: context.tt.bodyMedium,
          ),
          primaryXAxis: CategoryAxis(
            labelStyle: context.tt.titleMedium,
          ),
          series: List<CartesianSeries<ChartModel, String>>.generate(
            widget.data[0].yAxisProperty.length,
            (index) => ColumnSeries<ChartModel, String>(
              width: 0.3,
              animationDuration: widget.animationDuration ?? 1500,
              color: widget.columnColor?[index] ?? context.cs.primary,
              dataSource: widget.data,
              xValueMapper: (ChartModel xAxis, ind) =>
                  xAxis.xAxisProperty.replaceAll('"', ''),
              yValueMapper: (ChartModel yAxis, ind) =>
                  yAxis.yAxisProperty[index],
            ),
          ),
        ),
      );
    } else {
      return const Skeleton.replace(child: SfCartesianChart());
    }
  }
}
