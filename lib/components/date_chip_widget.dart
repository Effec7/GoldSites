import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'date_chip_model.dart';
export 'date_chip_model.dart';

class DateChipWidget extends StatefulWidget {
  const DateChipWidget({
    super.key,
    bool? selected,
    bool? isFull,
    String? day,
    String? date,
    String? status,
  })  : this.selected = selected ?? false,
        this.isFull = isFull ?? true,
        this.day = day ?? 'Po',
        this.date = date ?? '1',
        this.status = status ?? 'Obsadené';

  final bool selected;
  final bool isFull;
  final String day;
  final String date;
  final String status;

  @override
  State<DateChipWidget> createState() => _DateChipWidgetState();
}

class _DateChipWidgetState extends State<DateChipWidget> {
  late DateChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 84.0,
      decoration: BoxDecoration(
        color: () {
          if (widget!.selected) {
            return Color(0xFFD4AF37);
          } else if (widget!.isFull) {
            return Color(0x801A1F2C);
          } else {
            return Color(0xFF1A1F2C);
          }
        }(),
        borderRadius: BorderRadius.circular(24.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: () {
            if (widget!.selected) {
              return Color(0xFFD4AF37);
            } else if (widget!.isFull) {
              return Colors.transparent;
            } else {
              return Color(0x80D4AF37);
            }
          }(),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Container(
            height: 68.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.day,
                    'Po',
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: widget!.selected
                            ? Color(0xFF1A1F2C)
                            : Color(0x99FFFFFF),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        lineHeight: 1.4,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.date,
                    '1',
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color:
                            widget!.selected ? Color(0xFF1A1F2C) : Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                        lineHeight: 1.4,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.status,
                    'Obsadené',
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: () {
                          if (widget!.selected) {
                            return Color(0xFF1A1F2C);
                          } else if (widget!.isFull) {
                            return FlutterFlowTheme.of(context).error;
                          } else {
                            return FlutterFlowTheme.of(context).success;
                          }
                        }(),
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        lineHeight: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
