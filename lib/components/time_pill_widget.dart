import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_pill_model.dart';
export 'time_pill_model.dart';

class TimePillWidget extends StatefulWidget {
  const TimePillWidget({
    super.key,
    bool? selected,
    bool? disabled,
    String? time,
  })  : this.selected = selected ?? false,
        this.disabled = disabled ?? false,
        this.time = time ?? '09:00';

  final bool selected;
  final bool disabled;
  final String time;

  @override
  State<TimePillWidget> createState() => _TimePillWidgetState();
}

class _TimePillWidgetState extends State<TimePillWidget> {
  late TimePillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePillModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget!.disabled ? 0.5 : 1.0,
      child: Container(
        width: 92.0,
        height: 46.0,
        decoration: BoxDecoration(
          color: () {
            if (widget!.selected) {
              return Color(0xFFD4AF37);
            } else if (widget!.disabled) {
              return Color(0x4D1A1F2C);
            } else {
              return Color(0xFF1A1F2C);
            }
          }(),
          borderRadius: BorderRadius.circular(14.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: widget!.selected ? Color(0xFFD4AF37) : Color(0x66D4AF37),
            width: 1.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget!.time,
            '09:00',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.montserrat(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: () {
                  if (widget!.selected) {
                    return Color(0xFF1A1F2C);
                  } else if (widget!.disabled) {
                    return Color(0x4DFFFFFF);
                  } else {
                    return Colors.white;
                  }
                }(),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ),
    );
  }
}
