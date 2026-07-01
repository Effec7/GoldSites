import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/booking_services_empty_state_widget.dart';
import '/components/date_chip_widget.dart';
import '/components/progress_step_widget.dart';
import '/components/service_card_widget.dart';
import '/components/time_pill_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'objednavky_nove_doplnit_widget.dart' show ObjednavkyNoveDoplnitWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ObjednavkyNoveDoplnitModel
    extends FlutterFlowModel<ObjednavkyNoveDoplnitWidget> {
  ///  Local state fields for this page.

  String? selectedServiceId;

  String? selectedServiceName;

  double? selectedServicePrice;

  int? selectedServiceDuration;

  String? selectedDateKey;

  String? selectedDateLabel;

  String? selectedTime;

  DateTime? selectedBookingStartAt;

  int progressStep = 1;

  ///  State fields for stateful widgets in this page.

  // Model for ProgressStep.
  late ProgressStepModel progressStepModel1;
  // Model for ProgressStep.
  late ProgressStepModel progressStepModel2;
  // Model for ProgressStep.
  late ProgressStepModel progressStepModel3;
  // Models for ServiceCard.
  late FlutterFlowDynamicModels<ServiceCardModel> serviceCardModels;
  // Models for DateChip.
  late FlutterFlowDynamicModels<DateChipModel> dateChipModels;
  // Models for TimePill.
  late FlutterFlowDynamicModels<TimePillModel> timePillModels1;
  // Models for TimePill.
  late FlutterFlowDynamicModels<TimePillModel> timePillModels2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? createBooking;

  @override
  void initState(BuildContext context) {
    progressStepModel1 = createModel(context, () => ProgressStepModel());
    progressStepModel2 = createModel(context, () => ProgressStepModel());
    progressStepModel3 = createModel(context, () => ProgressStepModel());
    serviceCardModels = FlutterFlowDynamicModels(() => ServiceCardModel());
    dateChipModels = FlutterFlowDynamicModels(() => DateChipModel());
    timePillModels1 = FlutterFlowDynamicModels(() => TimePillModel());
    timePillModels2 = FlutterFlowDynamicModels(() => TimePillModel());
  }

  @override
  void dispose() {
    progressStepModel1.dispose();
    progressStepModel2.dispose();
    progressStepModel3.dispose();
    serviceCardModels.dispose();
    dateChipModels.dispose();
    timePillModels1.dispose();
    timePillModels2.dispose();
  }
}
