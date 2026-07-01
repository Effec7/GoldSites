import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_nav_bar_widget.dart';
import '/components/provider_bookings_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:async';
import 'profil_sluzieb_nastavit_widget.dart' show ProfilSluziebNastavitWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfilSluziebNastavitModel
    extends FlutterFlowModel<ProfilSluziebNastavitWidget> {
  ///  Local state fields for this page.

  String? providerBookingTab = 'new';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Potvrdiť Booking widget.
  List<BookingsRow>? updatedConfirmedBookingRows;
  Completer<List<BookingDetailVRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - Update Row(s)] action in Odmietnuť Booking widget.
  List<BookingsRow>? updatedDeclinedBookingRows;
  // Stores action output result for [Backend Call - Update Row(s)] action in Dokončiť Booking widget.
  List<BookingsRow>? updatedCompletedBookingRows;
  Completer<List<BookingDetailVRow>>? requestCompleter1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Zrušiť Booking widget.
  List<BookingsRow>? updatedCancelledBookingRows;
  // Model for CustomNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    customNavBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
