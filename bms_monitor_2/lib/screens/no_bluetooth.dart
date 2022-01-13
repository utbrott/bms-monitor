import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class NoBluetooth extends StatelessWidget {
  const NoBluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Palette.zinc[800],
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.bluetooth_disabled,
                size: 150.0,
                color: Palette.zinc[600],
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Bluetooth disabled',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 18,
                          color: Palette.zinc[100],
                          fontWeight: FontWeight.w400))),
              const SizedBox(height: 2),
              Text('Turn it on to use the app',
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Palette.zinc[400],
                          fontWeight: FontWeight.w400))),
            ],
          ),
        ),
      );
}
