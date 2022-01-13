import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ConnectionStatusBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConnectionStatusBar({Key? key, this.result, this.deviceName})
      : super(key: key);

  final ScanResult? result;
  final String? deviceName;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget? _deviceName(BuildContext context) {
    if (deviceName != null) {
      return Text(deviceName!,
          style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: 12,
                  color: Palette.zinc[300],
                  fontWeight: FontWeight.w500)));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) => AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Palette.zinc[800],
      centerTitle: true,
      elevation: 0.0,
      title: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text('BMS Monitor',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: Palette.zinc[100],
                            fontWeight: FontWeight.w600)))),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
              SpinKitDoubleBounce(
                size: 12,
                color: result != null ? Palette.green[400] : Palette.amber[400],
              ),
              const SizedBox(width: 4),
              Text(
                  result != null ? 'Connected to' : 'Waiting for connection...',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Palette.zinc[300],
                          fontWeight: FontWeight.w400))),
              if (result != null) ...[
                const SizedBox(width: 4),
                _deviceName(context)!
              ]
            ])),
          ),
        ],
      ));
}
