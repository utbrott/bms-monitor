import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'device_info/cells_config.dart';
import 'device_info/cell_stats.dart';
import 'device_info/charge_status.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({Key? key, required this.cells}) : super(key: key);
  final List<int> cells;

  double _getMaxVoltage(int cells) {
    return cells * 4.1;
  }

  double _getMaxCapacity(int cells) {
    return cells * 2.6;
  }

  double _randomChargePercent() {
    return math.Random().nextDouble();
  }

  double _getCurrentVoltage(
      double maxVoltage, double chargePercent, int cells) {
    final double discharge = ((0.8 * cells) *
        double.parse((chargePercent / 100).toStringAsFixed(2)));
    final double value = (maxVoltage - (0.8 * cells)) +
        double.parse(discharge.toStringAsFixed(2));
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final currentChargePercent = _randomChargePercent() * 100;
    return Container(
      color: Palette.zinc[800],
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              CellConfig(cells: cells),
              CellStats(
                maxVoltage: _getMaxVoltage(cells[0]).toStringAsFixed(1),
                maxCapacity: _getMaxCapacity(cells[1]).toStringAsFixed(1),
              ),
              ChargeStatus(
                voltage: _getCurrentVoltage(_getMaxVoltage(cells[0]),
                        currentChargePercent, cells[0])
                    .toStringAsFixed(2),
                percent: currentChargePercent.toStringAsFixed(1),
              )
            ],
          )),
    );
  }
}
