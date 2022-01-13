import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../theme/colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        label: Text('Search',
            style: GoogleFonts.rubik(
                textStyle: TextStyle(color: Palette.zinc[100]))),
        icon: const Icon(Icons.bluetooth_searching, size: 20),
        onPressed: () => FlutterBlue.instance
            .startScan(timeout: const Duration(seconds: 10)),
        backgroundColor: Palette.zinc[700],
      );
}

class SearchActiveButton extends StatelessWidget {
  const SearchActiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        label: Text('Searching...',
            style: GoogleFonts.rubik(
                textStyle: TextStyle(color: Palette.zinc[100]))),
        icon: SpinKitCubeGrid(
          size: 12,
          color: Palette.zinc[100],
        ),
        onPressed: () => FlutterBlue.instance.stopScan(),
        backgroundColor: Palette.zinc[600],
      );
}
