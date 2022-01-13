import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';

class CellStats extends StatelessWidget {
  const CellStats(
      {Key? key, required this.maxVoltage, required this.maxCapacity})
      : super(key: key);
  final String maxVoltage;
  final String maxCapacity;

  Widget _cellStat(BuildContext context,
      {required String name,
      required String data,
      required String unit,
      required IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Palette.blue[500], size: 28),
        const SizedBox(width: 8),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            name,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    color: Palette.zinc[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              Text(
                data,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        color: Palette.zinc[200],
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        color: Palette.zinc[200],
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _tileSize = MediaQuery.of(context).size.width * .8;
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            elevation: 6.0,
            shadowColor: Palette.zinc[900],
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Palette.zinc[700],
                ),
                child: SizedBox(
                  height: _tileSize / 3,
                  width: _tileSize,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _cellStat(context,
                                  name: 'Max Voltage',
                                  data: maxVoltage,
                                  unit: 'V',
                                  icon: Icons.offline_bolt_rounded),
                              const SizedBox(width: 16),
                              Container(
                                color: Palette.zinc[500],
                                child: const SizedBox(
                                  width: 1,
                                  height: 28,
                                ),
                              ),
                              const SizedBox(width: 16),
                              _cellStat(context,
                                  name: 'Max Capacity',
                                  data: maxCapacity,
                                  unit: 'Ah',
                                  icon: Icons.battery_full),
                            ],
                          ),
                        ],
                      )),
                ))));
  }
}
