import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';

class CellConfig extends StatelessWidget {
  const CellConfig({Key? key, required this.cells}) : super(key: key);
  final List<int> cells;

  @override
  Widget build(BuildContext context) {
    final double _tileSize = MediaQuery.of(context).size.width * .8;
    final String _cellsSeries = cells[0].toString();
    final String _cellsParallel = cells[1].toString();
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
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.view_stream_rounded,
                                  color: Palette.blue[500], size: 24),
                              const SizedBox(width: 4),
                              Text('Connected cells',
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          color: Palette.zinc[400],
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('${_cellsSeries}S',
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          color: Palette.zinc[200],
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500))),
                              const SizedBox(width: 32),
                              Container(
                                color: Palette.zinc[500],
                                child: const SizedBox(
                                  width: 1,
                                  height: 28,
                                ),
                              ),
                              const SizedBox(width: 32),
                              Text('${_cellsParallel}P',
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          color: Palette.zinc[200],
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500))),
                            ],
                          ),
                        ],
                      )),
                ))));
  }
}
