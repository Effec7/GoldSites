import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'provider_business_info_page_nastavene_widget.dart'
    show ProviderBusinessInfoPageNastaveneWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProviderBusinessInfoPageNastaveneModel
    extends FlutterFlowModel<ProviderBusinessInfoPageNastaveneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for BusinessNameTextField widget.
  FocusNode? businessNameTextFieldFocusNode;
  TextEditingController? businessNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      businessNameTextFieldTextControllerValidator;
  // State field(s) for ShortBioTextField widget.
  FocusNode? shortBioTextFieldFocusNode;
  TextEditingController? shortBioTextFieldTextController;
  String? Function(BuildContext, String?)?
      shortBioTextFieldTextControllerValidator;
  // State field(s) for PhoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for CityTextField widget.
  FocusNode? cityTextFieldFocusNode;
  TextEditingController? cityTextFieldTextController;
  String? Function(BuildContext, String?)? cityTextFieldTextControllerValidator;
  // State field(s) for AddressTextField widget.
  FocusNode? addressTextFieldFocusNode;
  TextEditingController? addressTextFieldTextController;
  String? Function(BuildContext, String?)?
      addressTextFieldTextControllerValidator;
  // State field(s) for ServiceAreaTextField widget.
  FocusNode? serviceAreaTextFieldFocusNode;
  TextEditingController? serviceAreaTextFieldTextController;
  String? Function(BuildContext, String?)?
      serviceAreaTextFieldTextControllerValidator;
  // State field(s) for DosahSluzbyTextField widget.
  FocusNode? dosahSluzbyTextFieldFocusNode;
  TextEditingController? dosahSluzbyTextFieldTextController;
  String? Function(BuildContext, String?)?
      dosahSluzbyTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    businessNameTextFieldFocusNode?.dispose();
    businessNameTextFieldTextController?.dispose();

    shortBioTextFieldFocusNode?.dispose();
    shortBioTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    cityTextFieldFocusNode?.dispose();
    cityTextFieldTextController?.dispose();

    addressTextFieldFocusNode?.dispose();
    addressTextFieldTextController?.dispose();

    serviceAreaTextFieldFocusNode?.dispose();
    serviceAreaTextFieldTextController?.dispose();

    dosahSluzbyTextFieldFocusNode?.dispose();
    dosahSluzbyTextFieldTextController?.dispose();
  }
}
