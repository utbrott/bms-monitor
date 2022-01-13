import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../theme/colors.dart';

class ChargeStatus extends StatelessWidget {
  const ChargeStatus({Key? key, required this.voltage, required this.percent})
      : super(key: key);
  final String voltage;
  final String percent;

  Widget _chargeStatusInfo(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: <Widget>[
                Text('Voltage',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(color: Palette.zinc[400]))),
                const SizedBox(width: 4),
                Text('${voltage}V',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: Palette.zinc[400],
                            fontWeight: FontWeight.w500))),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('$percent%',
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      color: Palette.zinc[200],
                      fontSize: 36,
                      fontWeight: FontWeight.w500))),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final double _tileSize = MediaQuery.of(context).size.width * .8;
    return Padding(
        padding: const EdgeInsets.all(16),
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
                  height: _tileSize,
                  width: _tileSize,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.bolt_rounded,
                                  color: Palette.blue[500], size: 24),
                              const SizedBox(width: 4),
                              Text('Current charge',
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          color: Palette.zinc[400],
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CircularPercentIndicator(
                            radius: _tileSize * .8,
                            lineWidth: 16,
                            percent: double.parse(percent) / 100,
                            backgroundColor: Palette.zinc[800] as Color,
                            progressColor: Palette.blue[500],
                            circularStrokeCap: CircularStrokeCap.round,
                            center: _chargeStatusInfo(context),
                            animation: true,
                          )
                        ],
                      )),
                ))));
  }
}
