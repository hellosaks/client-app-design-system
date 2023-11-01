import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/line_chart/data_point.dart";
import "package:client_app_design_system/components/line_chart/data_serie.dart";
import "package:doc_widget/doc_widget.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

@docWidget
class CustomLineChart extends StatefulWidget {
  final List<DataSerie> series;
  final bool showXAxisAsNumbers;
  final bool defaultStyle;
  final double height;
  final bool interactive;

  final String title;
  final String subtitle;

  final double? interval;
  // final FormartType formatType;

  const CustomLineChart({
    // required this.formatType,
    this.interval = 2.0,
    this.showXAxisAsNumbers = false,
    this.defaultStyle = true,
    this.interactive = false,
    required this.series,
    required this.height,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CustomLineChart> createState() => _ChartState();
}

class _ChartState extends State<CustomLineChart> {
  bool isClicked = false;
  Map<String, bool> serieEnabled = {};
  FLHorizontalAlignment positionLabel = FLHorizontalAlignment.center;
  void updateSeriesEnabled() {
    for (final serie in widget.series) {
      setState(() {
        serieEnabled[serie.name] = true;
      });
    }
  }

  @override
  void initState() {
    updateSeriesEnabled();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSeriesEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: _buildChart(),
      ),
    );
  }

  Widget _buildChartTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTypography(
          text: widget.title,
          variant: TypographyVariant.h5,
          weight: FontWeight.w600,
          color: ThemeSAKS.colors.primary.sea,
        ),
        CustomTypography(
          text: widget.subtitle,
          variant: TypographyVariant.h7,
          color: ThemeSAKS.colors.grayscale.strongGrey,
        )
      ],
    );
  }

  Widget _buildChart() {
    return LineChart(
      LineChartData(
        // read about it in the LineChartData section
        lineBarsData: _buildLineChart(),
        lineTouchData: widget.interactive
            ? LineTouchData(
                enabled: true,
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((spotIndex) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: ThemeSAKS.colors.primary.sea,
                        strokeWidth: 2,
                        dashArray: [10, 5],
                      ),
                      FlDotData(
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            color: barData.color,
                            strokeWidth: 0,
                          );
                        },
                      ),
                    );
                  }).toList();
                },
                touchSpotThreshold: 30,
                touchTooltipData: LineTouchTooltipData(
                  maxContentWidth: 300,
                  tooltipHorizontalAlignment: positionLabel,
                  tooltipBgColor: ThemeSAKS.colors.primary.sky,
                  getTooltipItems: (touchedSpots) {
                    //TODO change label position when at the end of the chart
                    touchedSpots
                        .sort((a, b) => a.barIndex.compareTo(b.barIndex));
                    return touchedSpots
                        .map(
                          (LineBarSpot touchedSpot) =>
                              _buildTootipInfo(touchedSpot: touchedSpot),
                        )
                        .toList();
                  },
                ),
                touchCallback: (event, lineTouch) {
                  setState(() {
                    if (event is FlTapDownEvent ||
                        event is FlLongPressMoveUpdate ||
                        event is FlLongPressStart ||
                        event is FlPanDownEvent ||
                        event is FlPanUpdateEvent) {
                      if (lineTouch != null &&
                          lineTouch.lineBarSpots != null &&
                          lineTouch.lineBarSpots?.isNotEmpty == true) {
                        final TouchLineBarSpot? item =
                            lineTouch.lineBarSpots?.first;
                        if (item != null) {
                          if (item.spotIndex == 0) {
                            setState(() {
                              positionLabel = FLHorizontalAlignment.right;
                            });
                            return;
                          }

                          if (item.spotIndex ==
                              widget.series.first.serie.length - 1) {
                            setState(() {
                              positionLabel = FLHorizontalAlignment.left;
                            });
                            return;
                          }

                          setState(() {
                            positionLabel = FLHorizontalAlignment.center;
                          });
                        }

                        isClicked = true;
                      }
                    } else {
                      isClicked = false;
                    }
                  });
                },
              )
            : LineTouchData(
                enabled: false,
                getTouchedSpotIndicator: (a, b) {
                  return b.map((e) => null).toList();
                },
              ),
        titlesData: _buildAxis(),
        gridData: _buildGridData(),
        borderData: FlBorderData(show: false),
      ),
      swapAnimationDuration: const Duration(milliseconds: 250), // Optional
      swapAnimationCurve: Curves.easeInOutSine, // Optional
    );
  }

  List<LineChartBarData> _buildLineChart() {
    return widget.series.map((serie) {
      final chartData = _chartData(serie.serie);
      return LineChartBarData(
        spots: chartData,
        isCurved: true,
        color: serie.color,
        show: serieEnabled[serie.name],
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: widget.interactive
            ? BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    serie.color.withOpacity(0.4),
                    serie.color.withOpacity(0.5),
                  ],
                ),
                spotsLine: BarAreaSpotsLine(
                  show: !isClicked,
                  flLineStyle: FlLine(
                    color: ThemeSAKS.colors.primary.sea,
                    strokeWidth: 2,
                    dashArray: [10, 5],
                  ),
                  checkToShowSpotLine: (spot) {
                    return chartData.indexOf(spot) == chartData.length - 1;
                  },
                ),
              )
            : BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    serie.color.withOpacity(0.02),
                    serie.color.withOpacity(0.05),
                    serie.color.withOpacity(0.5),
                  ],
                ),
              ),
        shadow: Shadow(
          blurRadius: 5.55,
          color: ThemeSAKS.colors.primary.saks.withOpacity(0.23),
          offset: const Offset(0, 10),
        ),
      );
    }).toList();
  }

  FlTitlesData _buildAxis() {
    return FlTitlesData(
      // hide axis top values
      topTitles: AxisTitles(
        axisNameWidget: Row(
          children: [
            _buildChartTitle(),
          ],
        ),
        axisNameSize: 40,
      ),
      // hide axis right values
      rightTitles: AxisTitles(),
      leftTitles: AxisTitles(),

      bottomTitles: AxisTitles(),
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      drawVerticalLine: false,
      getDrawingHorizontalLine: _buildHorizontalGridLine,
    );
  }

  LineTooltipItem _buildTootipInfo({required LineBarSpot touchedSpot}) {
    final textStyle = TextStyle(
      color: widget.series[touchedSpot.barIndex].color,
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );
    return LineTooltipItem(
      _buildLabel(touchedSpot: touchedSpot),
      textStyle,
    );
  }

  String _buildLabel({required LineBarSpot touchedSpot}) {
    final date = DateFormat("MM/yyyy").format(
      widget.series[touchedSpot.barIndex].serie[touchedSpot.spotIndex].date!,
    );
    final name = widget.series[touchedSpot.barIndex].name;
    switch (widget.series.first.formatType) {
      case FormartType.currency:
        return "$date\n$name: ${touchedSpot.y.toStringAsFixed(3)}";
      case FormartType.percentage:
        return "$date\n$name: ${touchedSpot.y - 1}";
      default:
        return "";
    }
  }

  List<FlSpot> _chartData(List<DataPoint> serie) {
    final List<FlSpot> points = [];
    for (int i = 0; i < serie.length; i++) {
      points.add(FlSpot(i.toDouble(), serie[i].value));
    }
    return points;
  }

  FlLine _buildHorizontalGridLine(double data) {
    return FlLine(
      strokeWidth: 0.0,
      color: OldThemeSAKS.colors.grayTone.colorGray11.withOpacity(0.6),
    );
  }
}
