import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../theme/colors.dart';
import '../screens/connected_device.dart';
import '../widgets/connection_status.dart';
import '../widgets/search_buttons.dart';
import '../widgets/scan_tile.dart';

class FindDevices extends StatelessWidget {
  const FindDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ConnectionStatusBar(),
      body: Container(
        color: Palette.zinc[800],
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<List<ScanResult>>(
            stream: FlutterBlue.instance.scanResults,
            initialData: const [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!
                  .map((res) => ScanTile(
                        result: res,
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ConnectedDevice(result: res);
                        })),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return const SearchActiveButton();
          } else {
            return const SearchButton();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
