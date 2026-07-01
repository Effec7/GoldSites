import '/components/switch_component2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'day_switch_row2_model.dart';
export 'day_switch_row2_model.dart';

class DaySwitchRow2Widget extends StatefulWidget {
  const DaySwitchRow2Widget({
    super.key,
    bool? active,
    String? label,
  })  : this.active = active ?? true,
        this.label = label ?? 'Pondelok';

  final bool active;
  final String label;

  @override
  State<DaySwitchRow2Widget> createState() => _DaySwitchRow2WidgetState();
}

class _DaySwitchRow2WidgetState extends State<DaySwitchRow2Widget> {
  late DaySwitchRow2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaySwitchRow2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.label,
                  'Pondelok',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.47,
                    ),
              ),
              wrapWithModel(
                model: _model.switchComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: SwitchComponent2Widget(
                  label: false,
                  variant: 'iOS',
                  active: valueOrDefault<bool>(
                    widget!.active,
                    true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
