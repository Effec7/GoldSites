import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'provider_setup_services_page_nastavene_widget.dart'
    show ProviderSetupServicesPageNastaveneWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProviderSetupServicesPageNastaveneModel
    extends FlutterFlowModel<ProviderSetupServicesPageNastaveneWidget> {
  ///  Local state fields for this page.

  String? mainImageUrl;

  String? gallery1Url;

  String? gallery2Url;

  String? gallery3Url;

  String? gallery4Url;

  String? gallery5Url;

  String? gallery6Url;

  List<String> galleryurls = [];
  void addToGalleryurls(String item) => galleryurls.add(item);
  void removeFromGalleryurls(String item) => galleryurls.remove(item);
  void removeAtIndexFromGalleryurls(int index) => galleryurls.removeAt(index);
  void insertAtIndexInGalleryurls(int index, String item) =>
      galleryurls.insert(index, item);
  void updateGalleryurlsAtIndex(int index, Function(String) updateFn) =>
      galleryurls[index] = updateFn(galleryurls[index]);

  void setGalleryUrl(int slot, String url) {
    switch (slot) {
      case 1:
        gallery1Url = url;
        break;
      case 2:
        gallery2Url = url;
        break;
      case 3:
        gallery3Url = url;
        break;
      case 4:
        gallery4Url = url;
        break;
    }

    galleryurls = <String>[
      if (gallery1Url?.isNotEmpty ?? false) gallery1Url!,
      if (gallery2Url?.isNotEmpty ?? false) gallery2Url!,
      if (gallery3Url?.isNotEmpty ?? false) gallery3Url!,
      if (gallery4Url?.isNotEmpty ?? false) gallery4Url!,
    ].toSet().toList();
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for Nazovsluzby widget.
  FocusNode? nazovsluzbyFocusNode;
  TextEditingController? nazovsluzbyTextController;
  String? Function(BuildContext, String?)? nazovsluzbyTextControllerValidator;
  // State field(s) for Kategoria widget.
  String? kategoriaValue;
  FormFieldController<String>? kategoriaValueController;
  // State field(s) for TypCeny widget.
  String? typCenyValue;
  FormFieldController<String>? typCenyValueController;
  // State field(s) for Popis_sluzby widget.
  FocusNode? popisSluzbyFocusNode;
  TextEditingController? popisSluzbyTextController;
  String? Function(BuildContext, String?)? popisSluzbyTextControllerValidator;
  // State field(s) for doba_trvania_sluzby widget.
  FocusNode? dobaTrvaniaSluzbyFocusNode;
  TextEditingController? dobaTrvaniaSluzbyTextController;
  String? Function(BuildContext, String?)?
      dobaTrvaniaSluzbyTextControllerValidator;
  // State field(s) for Cena_sluzby widget.
  FocusNode? cenaSluzbyFocusNode;
  TextEditingController? cenaSluzbyTextController;
  String? Function(BuildContext, String?)? cenaSluzbyTextControllerValidator;
  bool isDataUploading_uploadDataOid = false;
  FFUploadedFile uploadedLocalFile_uploadDataOid =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataOid = '';

  bool isDataUploading_uploadDataV96 = false;
  FFUploadedFile uploadedLocalFile_uploadDataV96 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataV96 = '';

  bool isDataUploading_uploadDataQpo = false;
  FFUploadedFile uploadedLocalFile_uploadDataQpo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataQpo = '';

  bool isDataUploading_uploadData9t1 = false;
  FFUploadedFile uploadedLocalFile_uploadData9t1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData9t1 = '';

  bool isDataUploading_uploadDataJl9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataJl9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJl9 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nazovsluzbyFocusNode?.dispose();
    nazovsluzbyTextController?.dispose();

    popisSluzbyFocusNode?.dispose();
    popisSluzbyTextController?.dispose();

    dobaTrvaniaSluzbyFocusNode?.dispose();
    dobaTrvaniaSluzbyTextController?.dispose();

    cenaSluzbyFocusNode?.dispose();
    cenaSluzbyTextController?.dispose();
  }
}
