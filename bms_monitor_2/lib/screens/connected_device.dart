import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import '../screens/find_devices.dart';
import '../widgets/device_info.dart';
import '../widgets/connection_status.dart';

class ConnectedDevice extends StatelessWidget {
  const ConnectedDevice({Key? key, required this.result}) : super(key: key);

  final ScanResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConnectionStatusBar(
        result: result,
        deviceName: result.device.name,
      ),
      body: const DeviceInfo(cells: [4, 4]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const FindDevices();
              })),
          backgroundColor: Palette.zinc[700],
          label: Text('Disconnect',
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(color: Palette.zinc[100]))),
          icon: const Icon(Icons.phonelink_erase, size: 20)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
