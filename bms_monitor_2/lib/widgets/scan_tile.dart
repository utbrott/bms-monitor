import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class ScanTile extends StatelessWidget {
  const ScanTile({Key? key, required this.result, this.onTap})
      : super(key: key);
  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(result.device.name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      color: Palette.zinc[100],
                      fontSize: 14,
                      fontWeight: FontWeight.w500))),
          const SizedBox(height: 4),
          Text(
            result.device.id.toString(),
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    color: Palette.zinc[400],
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(width: 4),
        ],
      );
    } else {
      return Text(result.device.id.toString());
    }
  }

  Widget _buildTile(BuildContext context) => Row(
        children: <Widget>[
          Icon(CupertinoIcons.bluetooth, color: Palette.blue[400], size: 24),
          const SizedBox(width: 16),
          _buildTitle(context),
          const SizedBox(width: 72),
          ElevatedButton(
              onPressed: onTap,
              child: Text(
                'Connect',
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        color: Palette.zinc[200],
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Palette.zinc[600] as Color)))
        ],
      );

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: Palette.zinc[700],
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: _buildTile(context))));
}
