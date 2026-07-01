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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider_setup_availability_page_nastavene_model.dart';
export 'provider_setup_availability_page_nastavene_model.dart';

class ProviderSetupAvailabilityPageNastaveneWidget extends StatefulWidget {
  const ProviderSetupAvailabilityPageNastaveneWidget({super.key});

  static String routeName = 'ProviderSetupAvailabilityPage-nastavene';
  static String routePath = 'providerSetupAvailabilityPageNastavene';

  @override
  State<ProviderSetupAvailabilityPageNastaveneWidget> createState() =>
      _ProviderSetupAvailabilityPageNastaveneWidgetState();
}

class _ProviderSetupAvailabilityPageNastaveneWidgetState
    extends State<ProviderSetupAvailabilityPageNastaveneWidget> {
  late ProviderSetupAvailabilityPageNastaveneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _availabilityLoadStarted = false;
  bool _availabilityLoaded = false;
  bool _isSavingAvailability = false;

  ProviderAvailabilityRow? _availabilityForDay(
    List<ProviderAvailabilityRow> rows,
    int dayOfWeek,
  ) {
    for (final row in rows) {
      if (row.dayOfWeek == dayOfWeek) {
        return row;
      }
    }
    return null;
  }

  String _timeLabel(PostgresTime? value, String fallback) {
    final time = value?.time;
    if (time == null) {
      return fallback;
    }
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _loadAvailability(String providerProfileId) async {
    try {
      final rows = await ProviderAvailabilityTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'provider_profile_id',
          providerProfileId,
        ),
      );
      if (!mounted) {
        return;
      }

      ProviderAvailabilityRow? timeRow;
      for (final row in rows) {
        if (row.startTime != null && row.endTime != null) {
          timeRow = row;
          if (row.isAvailable == true) {
            break;
          }
        }
      }

      final startTime = _timeLabel(timeRow?.startTime, '09:00');
      final endTime = _timeLabel(timeRow?.endTime, '17:00');
      safeSetState(() {
        _model.mondaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 1)?.isAvailable ?? true;
        _model.tuesdaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 2)?.isAvailable ?? true;
        _model.wednesdaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 3)?.isAvailable ?? true;
        _model.thursdaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 4)?.isAvailable ?? true;
        _model.fridaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 5)?.isAvailable ?? true;
        _model.saturdaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 6)?.isAvailable ?? false;
        _model.sundaySwitchRowModel.switchComponentModel.switchValue =
            _availabilityForDay(rows, 7)?.isAvailable ?? false;
        _model.zaciatokPraceSwitchValue = startTime;
        _model.koniecPraceSwitchValue = endTime;
        _model.zaciatokPraceSwitchValueController?.value = startTime;
        _model.koniecPraceSwitchValueController?.value = endTime;
        _availabilityLoaded = true;
      });
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dostupnosť sa nepodarilo načítať.'),
            duration: Duration(milliseconds: 4000),
          ),
        );
      }
    }
  }

  Future<void> _saveAvailabilityDay({
    required String providerProfileId,
    required List<ProviderAvailabilityRow> existingRows,
    required int dayOfWeek,
    required String dayName,
    required bool isAvailable,
    required String startTime,
    required String endTime,
  }) async {
    final data = <String, dynamic>{
      'is_available': isAvailable,
      'start_time': supaSerialize<PostgresTime>(
        PostgresTime.tryParse(startTime),
      ),
      'end_time': supaSerialize<PostgresTime>(
        PostgresTime.tryParse(endTime),
      ),
      'slot_minutes': 60,
      'day_name_sk': dayName,
      'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
    };

    if (_availabilityForDay(existingRows, dayOfWeek) != null) {
      await ProviderAvailabilityTable().update(
        data: data,
        matchingRows: (rows) => rows
            .eqOrNull('provider_profile_id', providerProfileId)
            .eqOrNull('day_of_week', dayOfWeek),
      );
    } else {
      await ProviderAvailabilityTable().insert({
        'provider_profile_id': providerProfileId,
        'day_of_week': dayOfWeek,
        ...data,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => ProviderSetupAvailabilityPageNastaveneModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProviderSetupAvailabilityPage-nastavene'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProviderProfilesRow>>(
      future: ProviderProfilesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<ProviderProfilesRow>
            providerSetupAvailabilityPageNastaveneProviderProfilesRowList =
            snapshot.data!;

        final providerSetupAvailabilityPageNastaveneProviderProfilesRow =
            providerSetupAvailabilityPageNastaveneProviderProfilesRowList
                    .isNotEmpty
                ? providerSetupAvailabilityPageNastaveneProviderProfilesRowList
                    .first
                : null;

        final providerProfileId =
            providerSetupAvailabilityPageNastaveneProviderProfilesRow?.id;
        if (!_availabilityLoadStarted &&
            providerProfileId != null &&
            providerProfileId.isNotEmpty) {
          _availabilityLoadStarted = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _loadAvailability(providerProfileId);
          });
        }

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              alignment: AlignmentDirectional(-1.0, -1.0),
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 24.0, 32.0, 120.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROVIDER_SETUP_AVAILABILITY_NASTAVENE_Co');
                                          logFirebaseEvent(
                                              'Container_navigate_back');
                                          context.safePop();
                                        },
                                        child: Container(
                                          width: 56.0,
                                          height: 56.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.chevron_left_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 28.0,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Krok 3 z 3',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                  lineHeight: 1.27,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kedy vás môžu zákazníci rezervovať?',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              color: Color(0xFFA88B38),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle: FontStyle.italic,
                                              lineHeight: 1.25,
                                            ),
                                      ),
                                      Text(
                                        'Nastavte, kedy vás môžu zákazníci rezervovať.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.47,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 7.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 7.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 7.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(28.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        wrapWithModel(
                                          model: _model.stepCardHeaderModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: StepCardHeader2Widget(
                                            icon: Icon(
                                              Icons.calendar_today_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                            subtitle:
                                                'Vyberte dni, kedy prijímate rezervácie.',
                                            title: 'Pracovné dni',
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.mondaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .mondaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    true,
                                                label: 'Pondelok',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.tuesdaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .tuesdaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    true,
                                                label: 'Utorok',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .wednesdaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .wednesdaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    true,
                                                label: 'Streda',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.thursdaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .thursdaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    true,
                                                label: 'Štvrtok',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.fridaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .fridaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    true,
                                                label: 'Piatok',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.saturdaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .saturdaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    false,
                                                label: 'Sobota',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.sundaySwitchRowModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DaySwitchRow2Widget(
                                                active: _model
                                                        .sundaySwitchRowModel
                                                        .switchComponentModel
                                                        .switchValue ??
                                                    false,
                                                label: 'Nedeľa',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(28.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        wrapWithModel(
                                          model: _model.stepCardHeaderModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: StepCardHeader2Widget(
                                            icon: Icon(
                                              Icons.schedule_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                            subtitle:
                                                'Zvoľte bežný čas, kedy poskytujete služby.',
                                            title: 'Pracovný čas',
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Od',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.38,
                                                        ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .zaciatokPraceSwitchValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.zaciatokPraceSwitchValue ??=
                                                          '09:00',
                                                    ),
                                                    options: [
                                                      '07:00',
                                                      '08:00',
                                                      '09:00',
                                                      '10:00',
                                                      '11:00',
                                                      '12:00',
                                                      '13:00',
                                                      '14:00',
                                                      '15:00',
                                                      '16:00',
                                                      '17:00',
                                                      '18:00',
                                                      '19:00',
                                                      '20:00',
                                                      '21:00'
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .zaciatokPraceSwitchValue =
                                                            val),
                                                    width: 200.0,
                                                    height: 40.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.47,
                                                            ),
                                                    hintText: '07:00',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        Color(0xFFA9872A),
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.0,
                                                    borderRadius: 18.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Do',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.38,
                                                        ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .koniecPraceSwitchValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.koniecPraceSwitchValue ??=
                                                          '17:00',
                                                    ),
                                                    options: [
                                                      '07:00',
                                                      '08:00',
                                                      '09:00',
                                                      '10:00',
                                                      '11:00',
                                                      '12:00',
                                                      '13:00',
                                                      '14:00',
                                                      '15:00',
                                                      '16:00',
                                                      '17:00',
                                                      '18:00',
                                                      '19:00',
                                                      '20:00',
                                                      '21:00'
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .koniecPraceSwitchValue =
                                                            val),
                                                    width: 200.0,
                                                    height: 40.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.47,
                                                            ),
                                                    hintText: '07:00',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        Color(0xFFA9872A),
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.0,
                                                    borderRadius: 18.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(28.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        wrapWithModel(
                                          model: _model.stepCardHeaderModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: StepCardHeader2Widget(
                                            icon: Icon(
                                              Icons.verified_user_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                            subtitle:
                                                'Nastavte základné pravidlá prijímania zákaziek.',
                                            title: 'Rezervácie',
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ako skoro si vás môžu zákazníci rezervovať?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        lineHeight: 1.38,
                                                      ),
                                                ),
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .bookingNoticeDropdownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.bookingNoticeDropdownValue ??=
                                                        '24 hodín vopred',
                                                  ),
                                                  options: [
                                                    '2 hodiny vopred',
                                                    '6 hodín vopred',
                                                    '24 hodín vopred',
                                                    '48 hodín vopred'
                                                  ],
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                            .bookingNoticeDropdownValue =
                                                        val);
                                                    logFirebaseEvent(
                                                        'PROVIDER_SETUP_AVAILABILITY_NASTAVENE_bo');
                                                    if (_model
                                                            .bookingNoticeDropdownValue ==
                                                        '2 hodiny vopred') {
                                                      logFirebaseEvent(
                                                          'bookingNoticeDropdown_update_page_state');
                                                      _model.bookingNoticeHours =
                                                          2;
                                                      safeSetState(() {});
                                                    } else {
                                                      if (_model
                                                              .bookingNoticeDropdownValue ==
                                                          '6 hodín vopred') {
                                                        logFirebaseEvent(
                                                            'bookingNoticeDropdown_update_page_state');
                                                        _model.bookingNoticeHours =
                                                            6;
                                                        safeSetState(() {});
                                                      } else {
                                                        if (_model
                                                                .bookingNoticeDropdownValue ==
                                                            '24 hodín vopred') {
                                                          logFirebaseEvent(
                                                              'bookingNoticeDropdown_update_page_state');
                                                          _model.bookingNoticeHours =
                                                              24;
                                                          safeSetState(() {});
                                                        } else {
                                                          if (_model
                                                                  .bookingNoticeDropdownValue ==
                                                              '48 hodín vopred') {
                                                            logFirebaseEvent(
                                                                'bookingNoticeDropdown_update_page_state');
                                                            _model.bookingNoticeHours =
                                                                48;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      }
                                                    }
                                                  },
                                                  height: 40.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.47,
                                                      ),
                                                  hintText: '2 hodiny vopred',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 24.0,
                                                  ),
                                                  fillColor: Color(0xFFA9872A),
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  focusBorderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  borderWidth: 1.0,
                                                  borderRadius: 18.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Divider(
                                              height: 16.0,
                                              thickness: 1.0,
                                              indent: 0.0,
                                              endIndent: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Prijímam urgentné zákazky',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.47,
                                                      ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .urgentneZakazkySwitchModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SwitchComponent2Widget(
                                                    label: false,
                                                    variant: 'iOS',
                                                    active: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Dochádzam za zákazníkom',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.47,
                                                      ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .dochadzamSwitchModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SwitchComponent2Widget(
                                                    label: false,
                                                    variant: 'iOS',
                                                    active: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 32.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryBackground,
                          FlutterFlowTheme.of(context).primaryBackground,
                          Colors.transparent
                        ],
                        stops: [0.0, 0.8, 1.0],
                        begin: AlignmentDirectional(0.0, 1.0),
                        end: AlignmentDirectional(0, -1.0),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Container(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FutureBuilder<List<ProviderAvailabilityRow>>(
                            future: providerProfileId != null
                                ? ProviderAvailabilityTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'provider_profile_id',
                                      providerProfileId,
                                    ),
                                  )
                                : Future.value(<ProviderAvailabilityRow>[]),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProviderAvailabilityRow>
                                  completeAndActivateProfileProviderAvailabilityRowList =
                                  snapshot.data!;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROVIDER_SETUP_AVAILABILITY_NASTAVENE_Co');
                                  if (providerSetupAvailabilityPageNastaveneProviderProfilesRow
                                              ?.id !=
                                          null &&
                                      providerSetupAvailabilityPageNastaveneProviderProfilesRow
                                              ?.id !=
                                          '') {
                                    if (!_availabilityLoaded) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Počkajte, kým sa dostupnosť načíta.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (_isSavingAvailability) {
                                      return;
                                    }
                                    final startTime =
                                        _model.zaciatokPraceSwitchValue ??
                                            '09:00';
                                    final endTime =
                                        _model.koniecPraceSwitchValue ?? '17:00';
                                    if (startTime.compareTo(endTime) >= 0) {
                                      logFirebaseEvent(
                                          'CompleteAndActivateProfile_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Čas ukončenia musí byť neskôr ako čas začiatku.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                      return;
                                    }

                                    safeSetState(
                                        () => _isSavingAvailability = true);
                                    try {
                                      logFirebaseEvent(
                                          'CompleteAndActivateProfile_backend_call');
                                      final profileId =
                                          providerSetupAvailabilityPageNastaveneProviderProfilesRow!
                                              .id!;
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 1,
                                        dayName: 'Pondelok',
                                        isAvailable: _model
                                                .mondaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            true,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 2,
                                        dayName: 'Utorok',
                                        isAvailable: _model
                                                .tuesdaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            true,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 3,
                                        dayName: 'Streda',
                                        isAvailable: _model
                                                .wednesdaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            true,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 4,
                                        dayName: 'Štvrtok',
                                        isAvailable: _model
                                                .thursdaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            true,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 5,
                                        dayName: 'Piatok',
                                        isAvailable: _model
                                                .fridaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            true,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 6,
                                        dayName: 'Sobota',
                                        isAvailable: _model
                                                .saturdaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            false,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await _saveAvailabilityDay(
                                        providerProfileId: profileId,
                                        existingRows:
                                            completeAndActivateProfileProviderAvailabilityRowList,
                                        dayOfWeek: 7,
                                        dayName: 'Nedeľa',
                                        isAvailable: _model
                                                .sundaySwitchRowModel
                                                .switchComponentModel
                                                .switchValue ??
                                            false,
                                        startTime: startTime,
                                        endTime: endTime,
                                      );
                                      await ProviderProfilesTable().update(
                                        data: {
                                          'onboarding_completed': true,
                                          'onboarding_step': 4,
                                          'is_active': true,
                                          'updated_at': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'user_id',
                                          currentUserUid,
                                        ),
                                      );
                                      logFirebaseEvent(
                                          'CompleteAndActivateProfile_update_app_st');
                                      FFAppState().isProvider = true;
                                      FFAppState().providerOnboardingCompleted =
                                          true;
                                      FFAppState().currentProviderProfileId =
                                          profileId;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'CompleteAndActivateProfile_show_snack_ba');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Profil poskytovateľa bol aktivovaný.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                      logFirebaseEvent(
                                          'CompleteAndActivateProfile_navigate_to');
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          MojeSluzbyNastaveneWidget.routeName);
                                    } catch (_) {
                                      logFirebaseEvent(
                                          'CompleteAndActivateProfile_show_snack_ba');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Dostupnosť sa nepodarilo bezpečne uložiť.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                    } finally {
                                      if (mounted) {
                                        safeSetState(() =>
                                            _isSavingAvailability = false);
                                      }
                                    }
                                  } else {
                                    logFirebaseEvent(
                                        'CompleteAndActivateProfile_show_snack_ba');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Profil poskytovateľa sa nepodarilo nájsť.',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.completeAndActivateProfileModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ButtonWidget(
                                    content: 'Dokončiť a aktivovať profil',
                                    icon_present: false,
                                    icon_end_present: false,
                                    radius: 24.0,
                                    variant: 'primary',
                                    size: 'large',
                                    full_width: true,
                                    loading: !_availabilityLoaded ||
                                        _isSavingAvailability,
                                    disabled: !_availabilityLoaded ||
                                        _isSavingAvailability,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
