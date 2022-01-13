import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'screens/no_bluetooth.dart';
import 'screens/find_devices.dart';

void main() => runApp(const MonitorApp());

class MonitorApp extends StatelessWidget {
  const MonitorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.off) {
              return const NoBluetooth();
            }
            return const FindDevices();
          }),
    );
  }
}
