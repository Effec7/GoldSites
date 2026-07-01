import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/components/day_switch_row2_widget.dart';
import '/components/step_card_header2_widget.dart';
import '/components/switch_component2_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'provider_setup_availability_page_nastavene_widget.dart'
    show ProviderSetupAvailabilityPageNastaveneWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProviderSetupAvailabilityPageNastaveneModel
    extends FlutterFlowModel<ProviderSetupAvailabilityPageNastaveneWidget> {
  ///  Local state fields for this page.

  int? bookingNoticeHours;

  ///  State fields for stateful widgets in this page.

  // Model for StepCardHeader.
  late StepCardHeader2Model stepCardHeaderModel1;
  // Model for MondaySwitchRow.
  late DaySwitchRow2Model mondaySwitchRowModel;
  // Model for TuesdaySwitchRow.
  late DaySwitchRow2Model tuesdaySwitchRowModel;
  // Model for WednesdaySwitchRow.
  late DaySwitchRow2Model wednesdaySwitchRowModel;
  // Model for ThursdaySwitchRow.
  late DaySwitchRow2Model thursdaySwitchRowModel;
  // Model for FridaySwitchRow.
  late DaySwitchRow2Model fridaySwitchRowModel;
  // Model for SaturdaySwitchRow.
  late DaySwitchRow2Model saturdaySwitchRowModel;
  // Model for SundaySwitchRow.
  late DaySwitchRow2Model sundaySwitchRowModel;
  // Model for StepCardHeader.
  late StepCardHeader2Model stepCardHeaderModel2;
  // State field(s) for ZaciatokPraceSwitch widget.
  String? zaciatokPraceSwitchValue;
  FormFieldController<String>? zaciatokPraceSwitchValueController;
  // State field(s) for KoniecPraceSwitch widget.
  String? koniecPraceSwitchValue;
  FormFieldController<String>? koniecPraceSwitchValueController;
  // Model for StepCardHeader.
  late StepCardHeader2Model stepCardHeaderModel3;
  // State field(s) for bookingNoticeDropdown widget.
  String? bookingNoticeDropdownValue;
  FormFieldController<String>? bookingNoticeDropdownValueController;
  // Model for urgentneZakazkySwitch.
  late SwitchComponent2Model urgentneZakazkySwitchModel;
  // Model for DochadzamSwitch.
  late SwitchComponent2Model dochadzamSwitchModel;
  // Model for Complete And Activate Profile.
  late ButtonModel completeAndActivateProfileModel;

  @override
  void initState(BuildContext context) {
    stepCardHeaderModel1 = createModel(context, () => StepCardHeader2Model());
    mondaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    tuesdaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    wednesdaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    thursdaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    fridaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    saturdaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    sundaySwitchRowModel = createModel(context, () => DaySwitchRow2Model());
    stepCardHeaderModel2 = createModel(context, () => StepCardHeader2Model());
    stepCardHeaderModel3 = createModel(context, () => StepCardHeader2Model());
    urgentneZakazkySwitchModel =
        createModel(context, () => SwitchComponent2Model());
    dochadzamSwitchModel = createModel(context, () => SwitchComponent2Model());
    completeAndActivateProfileModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    stepCardHeaderModel1.dispose();
    mondaySwitchRowModel.dispose();
    tuesdaySwitchRowModel.dispose();
    wednesdaySwitchRowModel.dispose();
    thursdaySwitchRowModel.dispose();
    fridaySwitchRowModel.dispose();
    saturdaySwitchRowModel.dispose();
    sundaySwitchRowModel.dispose();
    stepCardHeaderModel2.dispose();
    stepCardHeaderModel3.dispose();
    urgentneZakazkySwitchModel.dispose();
    dochadzamSwitchModel.dispose();
    completeAndActivateProfileModel.dispose();
  }
}
