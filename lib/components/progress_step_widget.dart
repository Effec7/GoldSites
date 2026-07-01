import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'progress_step_model.dart';
export 'progress_step_model.dart';

class ProgressStepWidget extends StatefulWidget {
  const ProgressStepWidget({
    super.key,
    bool? active,
    bool? completed,
    this.icon,
    String? label,
  })  : this.active = active ?? true,
        this.completed = completed ?? false,
        this.label = label ?? 'Služba';

  final bool active;
  final bool completed;
  final Widget? icon;
  final String label;

  @override
  State<ProgressStepWidget> createState() => _ProgressStepWidgetState();
}

class _ProgressStepWidgetState extends State<ProgressStepWidget> {
  late ProgressStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressStepModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: widget!.active ? Color(0xFFD4AF37) : Colors.transparent,
            borderRadius: BorderRadius.circular(9999.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: widget!.active ? Color(0xFFD4AF37) : Color(0x4DD4AF37),
              width: 1.0,
            ),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 14.0,
            height: 14.0,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                if (widget!.completed ? true : false)
                  Icon(
                    Icons.check_rounded,
                    color:
                        widget!.active ? Color(0xFF1A1F2C) : Color(0xFFD4AF37),
                    size: 14.0,
                  ),
              ],
            ),
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget!.label,
            'Služba',
          ),
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.montserrat(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                ),
                color: widget!.active ? Color(0xFFD4AF37) : Color(0x80D4AF37),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ].divide(SizedBox(width: 4.0)),
    );
  }
}
