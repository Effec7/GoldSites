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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'objednavky_nove_doplnit_model.dart';
export 'objednavky_nove_doplnit_model.dart';

/// Create a sleek, compact premium mobile booking page for the GoldSites app.
///
/// Page name:
/// BookServicePage
///
/// Language:
/// Slovak only.
///
/// Main goal:
/// Make ordering a service extremely simple and foolproof. The customer
/// should instantly understand what to do:
///
/// 1. choose one service
/// 2. choose one date
/// 3. choose one time
/// 4. continue to confirmation
///
/// The page must feel:
///
/// * sleek
/// * premium
/// * dark
/// * elegant
/// * calm
/// * easy to scan
/// * compact
/// * impossible to misunderstand
///
/// Use the GoldSites style:
///
/// * deep dark navy background
/// * luxury gold accents
/// * champagne highlights
/// * soft rounded cards
/// * subtle glow only where needed
/// * premium bold italic headings
/// * readable modern text
/// * no clutter
/// * no oversized elements
///
/// Very important:
/// Make the page visually compact so the user does not have to scroll too
/// much.
/// The entire booking flow should feel tight, efficient, and mobile-friendly.
///
/// Size guidance:
///
/// * Page title: 26–28 px
/// * Section titles: 20–22 px
/// * Card titles: 17–19 px
/// * Body text: 14–15 px
/// * Small metadata: 12–13 px
/// * Header height: compact, max 135–145 px
/// * Service card height: around 100–110 px
/// * Provider card height: around 90–100 px
/// * Date chips: around 72–76 px wide and 82–88 px high
/// * Time chips: small and compact, around 44–48 px high
/// * Sticky bottom summary: max 145–155 px high
///
/// Use a Stack layout:
///
/// * scrollable main content
/// * sticky bottom summary fixed to the bottom
/// * enough bottom padding so content is not hidden behind the sticky summary
///
/// HEADER:
/// Create a compact dark navy header with:
///
/// * gold back arrow on the left
/// * centered title: “Objednať službu”
/// * subtitle: “Vyberte službu, termín a čas rezervácie.”
///
/// The title must be fully readable and must not overlap the notch or Dynamic
/// Island.
/// Do not use a white header.
/// Do not make the title huge.
///
/// PROGRESS:
/// Add a simple compact 3-step row:
/// Služba → Termín → Čas
///
/// The progress must be clear:
///
/// * current step = gold
/// * completed step = subtle completed state or gold check
/// * inactive step = dark with thin gold border
///
/// Do not make all three steps gold at once.
/// Do not make them look like giant buttons.
///
/// PROVIDER CARD:
/// Create one compact provider card showing:
///
/// * provider image
/// * Luxe Hair Studio
/// * Kaderníctvo • Bratislava
/// * gold star + 4.9 • 124 recenzií
///
/// Style:
///
/// * dark navy card
/// * subtle gold border
/// * rounded corners
/// * compact and elegant
///
/// SERVICE SECTION:
/// Title:
/// “Vyberte si službu”
///
/// Subtitle:
/// “Vyberte jednu službu.”
///
/// Show compact service cards in a vertical list.
///
/// Each service card should show:
///
/// * small image on the left
/// * service name
/// * short description
/// * duration
/// * price
///
/// Example services:
///
/// 1. Dámsky strih & Styling — Kompletný strih, umytie a fúkaná — 60 min — 45
/// €
/// 2. Farbenie vlasov — Profesionálne farbenie vlasov — 120 min — Od 65 €
/// 3. Kúra Olaplex — Hĺbková regenerácia vlasov — 45 min — 35 €
///
/// Selected service:
///
/// * champagne/gold light card
/// * gold border
/// * badge “Vybrané”
/// * dark navy text
///
/// Unselected service:
///
/// * dark navy card
/// * thin gold border
/// * white/champagne text
/// * no badge
///
/// Important:
/// Only ONE service can look selected.
/// Do not show “Vybrané” on every card.
/// Unselected cards must look tappable, not disabled.
///
/// DATE SECTION:
/// Title:
/// “Vyberte si dátum”
///
/// Subtitle:
/// “Najbližšie dostupné termíny.”
///
/// Use compact horizontal date chips, not a full calendar.
///
/// Example:
/// Po 1 Obsadené
/// Ut 2 6 voľných
/// St 3 4 voľné
/// Št 4 8 voľných
/// Pi 5 2 voľné
///
/// Selected date:
///
/// * gold background
/// * dark navy text
///
/// Available date:
///
/// * dark navy background
/// * gold border
/// * white text
/// * green availability text
///
/// Unavailable date:
///
/// * muted dark card
/// * red “Obsadené”
///
/// Make sure date chips are compact and not clipped at the edges.
///
/// TIME SECTION:
/// Title:
/// “Vyberte si čas”
///
/// Subtitle:
/// “Voľné časy pre vybraný dátum.”
///
/// This section must be compact.
/// The user should see as many time options as possible without excessive
/// scrolling.
///
/// Use small time chips in a 3-column grid.
/// Do NOT use large square boxes.
///
/// Time chips must be:
///
/// * compact
/// * low height
/// * easy to tap
/// * visually lighter
/// * more like pills / rounded buttons than cards
///
/// Preferred time chip size:
///
/// * height around 44–48 px
/// * medium width
/// * rounded corners around 14–16 px
/// * small spacing between chips
///
/// Groups:
/// Dopoludnia:
/// 09:00, 09:30, 10:00, 10:30, 11:00, 11:30
///
/// Popoludní:
/// 13:00, 13:30, 14:00
///
/// Selected time:
///
/// * gold background
/// * dark navy text
///
/// Available time:
///
/// * dark navy background
/// * thin gold border
/// * white text
///
/// Unavailable time:
///
/// * muted dark chip
/// * gray text
///
/// Very important:
/// Make the time section significantly more compact than before.
/// Reduce the overall height of the time area so the page feels shorter and
/// more efficient.
///
/// LOCKED STATES:
/// Before service is selected, show in the date section:
/// “Najprv vyberte službu.”
///
/// Before date is selected, show in the time section:
/// “Vyberte dátum a zobrazia sa voľné časy.”
///
/// STICKY BOTTOM SUMMARY:
/// Create a compact sticky bottom panel.
///
/// Before everything is selected:
/// Title:
/// “Dokončite výber”
/// Subtitle:
/// “Vyberte službu, dátum a čas.”
/// Disabled button:
/// “Pokračovať”
///
/// After service, date, and time are selected:
/// Show:
/// “Dámsky strih & Styling”
/// “45 €”
/// “Ut 2. jún • 10:30 • 60 min”
///
/// Button:
/// “Pokračovať na potvrdenie”
///
/// Button style:
///
/// * full width
/// * gold background
/// * dark navy text
/// * rounded corners
/// * height around 48–52 px
/// * clearly visible
///
/// INTERACTION LOGIC:
/// Prepare the page for this behavior:
///
/// * tapping a service selects only that service
/// * tapping another service resets selected date and selected time
/// * tapping a date selects only that date
/// * tapping another date resets selected time
/// * tapping a time selects only that time
/// * continue button is enabled only after service, date, and time are
/// selected
/// * continue navigates to BookingConfirmationPage
/// * do not create the booking on this page
///
/// UX PRINCIPLE:
/// Make the page so simple and clear that even a child could complete the
/// booking:
///
/// * one obvious action at a time
/// * compact layout
/// * obvious selected states
/// * obvious disabled states
/// * no clutter
/// * no oversized elements
/// * minimal scrolling
///
/// DO NOT:
///
/// * do not create a white page
/// * do not create a giant header
/// * do not use huge service cards
/// * do not use huge time boxes
/// * do not make the time chips tall
/// * do not clip the title
/// * do not clip date chips
/// * do not show “Vybrané” on every service
/// * do not make all progress steps gold
/// * do not use English
/// * do not use placeholders
/// * do not create a booking record on this page
///
/// Final result:
/// A sleek, compact, premium GoldSites booking page where the customer can
/// choose service, date, and time quickly, clearly, and with minimal
/// scrolling.
class ObjednavkyNoveDoplnitWidget extends StatefulWidget {
  const ObjednavkyNoveDoplnitWidget({
    super.key,
    required this.providerId,
    this.initialServiceId,
  });

  final String? providerId;
  final String? initialServiceId;

  static String routeName = 'ObjednavkyNoveDoplnit';
  static String routePath = 'objednavkyNoveDoplnit';

  @override
  State<ObjednavkyNoveDoplnitWidget> createState() =>
      _ObjednavkyNoveDoplnitWidgetState();
}

class _ObjednavkyNoveDoplnitWidgetState
    extends State<ObjednavkyNoveDoplnitWidget> {
  late ObjednavkyNoveDoplnitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ObjednavkyNoveDoplnitModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ObjednavkyNoveDoplnit'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OBJEDNAVKY_NOVE_DOPLNIT_ObjednavkyNoveDo');
      if (widget!.initialServiceId != null && widget!.initialServiceId != '') {
        logFirebaseEvent('ObjednavkyNoveDoplnit_update_page_state');
        _model.selectedServiceId = widget!.initialServiceId;
        _model.progressStep = 2;
        safeSetState(() {});
      } else {
        logFirebaseEvent('ObjednavkyNoveDoplnit_rebuild_page');
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0D1117),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 160.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0D1117),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 48.0, 20.0, 20.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              fillColor: Colors.transparent,
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color: Color(0xFFD4AF37),
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'OBJEDNAVKY_NOVE_DOPLNIT_IconButton_ON_TA');
                                                logFirebaseEvent(
                                                    'IconButton_navigate_back');
                                                context.safePop();
                                              },
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GradientText(
                                                  'Objednať službu',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                        color:
                                                            Color(0xFFD4AF37),
                                                        fontSize: 26.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        lineHeight: 1.4,
                                                      ),
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary
                                                  ],
                                                  gradientDirection:
                                                      GradientDirection.ltr,
                                                  gradientType:
                                                      GradientType.linear,
                                                ),
                                                Text(
                                                  'Vyberte službu, termín a čas rezervácie.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xB3FFFFFF),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 40.0,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              wrapWithModel(
                                                model:
                                                    _model.progressStepModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ProgressStepWidget(
                                                  active: true,
                                                  completed: false,
                                                  icon: Icon(
                                                    Icons.content_cut_rounded,
                                                  ),
                                                  label: 'Služba',
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.progressStepModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ProgressStepWidget(
                                                  active: _model.progressStep
                                                              .toString() ==
                                                          '2'
                                                      ? true
                                                      : false,
                                                  completed: false,
                                                  icon: Icon(
                                                    Icons
                                                        .event_available_rounded,
                                                  ),
                                                  label: 'Termín',
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.progressStepModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ProgressStepWidget(
                                                  active:
                                                      _model.progressStep == 4
                                                          ? true
                                                          : false,
                                                  completed: false,
                                                  icon: Icon(
                                                    Icons.schedule_rounded,
                                                  ),
                                                  label: 'Čas',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 8.0),
                            child: Container(
                              child: FutureBuilder<
                                  List<VProviderProfilesPublicRow>>(
                                future: VProviderProfilesPublicTable()
                                    .querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'provider_profile_id',
                                    widget!.providerId,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<VProviderProfilesPublicRow>
                                      containerVProviderProfilesPublicRowList =
                                      snapshot.data!;

                                  final containerVProviderProfilesPublicRow =
                                      containerVProviderProfilesPublicRowList
                                              .isNotEmpty
                                          ? containerVProviderProfilesPublicRowList
                                              .first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1A1F2C),
                                      borderRadius: BorderRadius.circular(24.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0x4DD4AF37),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 0),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 0),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  containerVProviderProfilesPublicRow
                                                      ?.logoUrl,
                                                  'https://dimg.dreamflow.cloud/v1/image/modern%20luxury%20hair%20salon%20interior',
                                                ),
                                                width: 48.0,
                                                height: 48.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
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
                                                    valueOrDefault<String>(
                                                      containerVProviderProfilesPublicRow
                                                          ?.businessName,
                                                      'Luxe Hair Studio',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.4,
                                                        ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      '${containerVProviderProfilesPublicRow?.categoryName} • ${containerVProviderProfilesPublicRow?.city}',
                                                      'Kaderníctvo • Bratislava',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0x99FFFFFF),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                          lineHeight: 1.4,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color: Color(0xFFD4AF37),
                                                      size: 16.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        containerVProviderProfilesPublicRow
                                                            ?.averageRating
                                                            ?.toString(),
                                                        '4.9',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                                Text(
                                                  '${valueOrDefault<String>(
                                                    containerVProviderProfilesPublicRow
                                                        ?.reviewCount
                                                        ?.toString(),
                                                    '123',
                                                  )} recenzií',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0x99FFFFFF),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vyberte si službu',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            color: Color(0xFFD4AF37),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Text(
                                      'Vyberte jednu službu.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: Color(0x99FFFFFF),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                FutureBuilder<List<ProviderServicesRow>>(
                                  future: ProviderServicesTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'provider_profile_id',
                                          widget!.providerId,
                                        )
                                        .eqOrNull(
                                          'is_active',
                                          true,
                                        )
                                        .order('created_at', ascending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProviderServicesRow>
                                        listViewProviderServicesRowList =
                                        snapshot.data!;

                                    if (listViewProviderServicesRowList
                                        .isEmpty) {
                                      return Center(
                                        child:
                                            BookingServicesEmptyStateWidget(),
                                      );
                                    }

                                    return Builder(
                                      builder: (context) {
                                        final bookingServiceItem =
                                            listViewProviderServicesRowList
                                                .toList();
                                        if (bookingServiceItem.isEmpty) {
                                          return Center(
                                            child:
                                                BookingServicesEmptyStateWidget(),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: bookingServiceItem.length,
                                          itemBuilder: (context,
                                              bookingServiceItemIndex) {
                                            final bookingServiceItemItem =
                                                bookingServiceItem[
                                                    bookingServiceItemIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'OBJEDNAVKY_NOVE_DOPLNIT_ServiceCard_ON_T');
                                                logFirebaseEvent(
                                                    'ServiceCard_update_page_state');
                                                _model.selectedServiceId =
                                                    bookingServiceItemItem.id;
                                                _model.selectedServiceName =
                                                    bookingServiceItemItem
                                                        .serviceName;
                                                _model.selectedServicePrice =
                                                    bookingServiceItemItem
                                                        .price;
                                                _model.selectedServiceDuration =
                                                    bookingServiceItemItem
                                                        .durationMinutes;
                                                _model.selectedDateKey = null;
                                                _model.selectedDateLabel = null;
                                                _model.selectedTime = null;
                                                _model.progressStep = 2;
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.serviceCardModels
                                                    .getModel(
                                                  bookingServiceItemItem.id!,
                                                  bookingServiceItemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ServiceCardWidget(
                                                  key: Key(
                                                    'Keycxx_${bookingServiceItemItem.id!}',
                                                  ),
                                                  selected: _model
                                                          .selectedServiceId ==
                                                      bookingServiceItemItem.id,
                                                  imgDesc:
                                                      valueOrDefault<String>(
                                                    bookingServiceItemItem
                                                        .mainImageUrl,
                                                    'https://dimg.dreamflow.cloud/v1/image/hair%20treatment%20olaplex',
                                                  ),
                                                  name: valueOrDefault<String>(
                                                    bookingServiceItemItem
                                                        .serviceName,
                                                    'Kúra Olaplex',
                                                  ),
                                                  desc: valueOrDefault<String>(
                                                    bookingServiceItemItem
                                                        .description,
                                                    'Hĺbková regenerácia vlasov',
                                                  ),
                                                  duration:
                                                      '${bookingServiceItemItem.durationMinutes?.toString()} min',
                                                  price:
                                                      '${bookingServiceItemItem.price?.toString()}€',
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.selectedServiceId == null ||
                                  _model.selectedServiceId == '')
                                Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Text(
                                    'Najskôr si vyberte službu, neskôr si vyberiete dátum',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          color: Color(0xFFD4AF37),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w200,
                                          fontStyle: FontStyle.italic,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                          if (_model.selectedServiceId != null &&
                              _model.selectedServiceId != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vyberte si dátum',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              color: Color(0xFFD4AF37),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      Text(
                                        'Najbližšie dostupné termíny.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0x99FFFFFF),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  if (_model.selectedServiceId != null &&
                                      _model.selectedServiceId != '')
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Container(
                                              child: FutureBuilder<
                                                  List<
                                                      BookingAvailableDatesVRow>>(
                                                future:
                                                    BookingAvailableDatesVTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'provider_profile_id',
                                                        widget!.providerId,
                                                      )
                                                      .eqOrNull(
                                                        'provider_service_id',
                                                        _model
                                                            .selectedServiceId,
                                                      ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<BookingAvailableDatesVRow>
                                                      rowBookingAvailableDatesVRowList =
                                                      snapshot.data!;

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        rowBookingAvailableDatesVRowList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowBookingAvailableDatesVRow =
                                                          rowBookingAvailableDatesVRowList[
                                                              rowIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'OBJEDNAVKY_NOVE_DOPLNIT_DateChip_ON_TAP');
                                                          logFirebaseEvent(
                                                              'DateChip_update_page_state');
                                                          _model.selectedDateKey =
                                                              rowBookingAvailableDatesVRow
                                                                  .dateKey;
                                                          _model.selectedDateLabel =
                                                              rowBookingAvailableDatesVRow
                                                                  .dateLabel;
                                                          _model.selectedTime =
                                                              null;
                                                          _model.selectedBookingStartAt =
                                                              null;
                                                          _model.progressStep =
                                                              3;
                                                          safeSetState(() {});
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .dateChipModels
                                                              .getModel(
                                                            rowBookingAvailableDatesVRow
                                                                .dateKey!,
                                                            rowIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: DateChipWidget(
                                                            key: Key(
                                                              'Keyk8s_${rowBookingAvailableDatesVRow.dateKey!}',
                                                            ),
                                                            selected: _model
                                                                    .selectedDateKey ==
                                                                rowBookingAvailableDatesVRow
                                                                    .dateKey,
                                                            isFull: false,
                                                            day: valueOrDefault<
                                                                String>(
                                                              rowBookingAvailableDatesVRow
                                                                  .weekdayLabel,
                                                              'Po',
                                                            ),
                                                            date:
                                                                valueOrDefault<
                                                                    String>(
                                                              rowBookingAvailableDatesVRow
                                                                  .dayNumber
                                                                  ?.toString(),
                                                              '1',
                                                            ),
                                                            status:
                                                                '${valueOrDefault<String>(
                                                              rowBookingAvailableDatesVRow
                                                                  .availableSlotsCount
                                                                  ?.toString(),
                                                              '12',
                                                            )} voľných',
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 16.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          if (_model.selectedDateKey == null ||
                              _model.selectedDateKey == '')
                            Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Text(
                                'Najskôr si vyberte dátum, neskôr si vyberiete čas',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w200,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      color: Color(0xFFD4AF37),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ),
                          if (_model.selectedDateKey != null &&
                              _model.selectedDateKey != '')
                            Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vyberte si čas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              color: Color(0xFFD4AF37),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      Text(
                                        'Voľné časy pre vybraný dátum.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0x99FFFFFF),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Text(
                                    'Dopoludnia',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFD4AF37),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  FutureBuilder<
                                      List<BookingAvailableTimesVRow>>(
                                    future:
                                        BookingAvailableTimesVTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'provider_profile_id',
                                            widget!.providerId,
                                          )
                                          .eqOrNull(
                                            'provider_service_id',
                                            _model.selectedServiceId,
                                          )
                                          .eqOrNull(
                                            'date_key',
                                            _model.selectedDateKey,
                                          )
                                          .eqOrNull(
                                            'period_key',
                                            'morning',
                                          )
                                          .order('slot_time', ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BookingAvailableTimesVRow>
                                          wrapBookingAvailableTimesVRowList =
                                          snapshot.data!;

                                      return Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            wrapBookingAvailableTimesVRowList
                                                .length, (wrapIndex) {
                                          final wrapBookingAvailableTimesVRow =
                                              wrapBookingAvailableTimesVRowList[
                                                  wrapIndex];
                                          return Opacity(
                                            opacity: 0.7,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'OBJEDNAVKY_NOVE_DOPLNIT_TimePill_ON_TAP');
                                                logFirebaseEvent(
                                                    'TimePill_update_page_state');
                                                _model.selectedTime =
                                                    wrapBookingAvailableTimesVRow
                                                        .timeLabel;
                                                _model.selectedBookingStartAt =
                                                    wrapBookingAvailableTimesVRow
                                                        .slotStartAt;
                                                _model.progressStep = 4;
                                                safeSetState(() {});
                                              },
                                              child: wrapWithModel(
                                                model: _model.timePillModels1
                                                    .getModel(
                                                  '${wrapBookingAvailableTimesVRow.dateKey}-${wrapBookingAvailableTimesVRow.timeLabel}-morning',
                                                  wrapIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TimePillWidget(
                                                  key: Key(
                                                    'Keyiru_${'${wrapBookingAvailableTimesVRow.dateKey}-${wrapBookingAvailableTimesVRow.timeLabel}-morning'}',
                                                  ),
                                                  selected: _model
                                                          .selectedTime ==
                                                      wrapBookingAvailableTimesVRow
                                                          .timeLabel,
                                                  disabled: false,
                                                  time: valueOrDefault<String>(
                                                    wrapBookingAvailableTimesVRow
                                                        .timeLabel,
                                                    '11:30',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  Text(
                                    'Popoludní',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFD4AF37),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  FutureBuilder<
                                      List<BookingAvailableTimesVRow>>(
                                    future:
                                        BookingAvailableTimesVTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'provider_profile_id',
                                            widget!.providerId,
                                          )
                                          .eqOrNull(
                                            'provider_service_id',
                                            _model.selectedServiceId,
                                          )
                                          .eqOrNull(
                                            'date_key',
                                            _model.selectedDateKey,
                                          )
                                          .eqOrNull(
                                            'period_key',
                                            'afternoon',
                                          )
                                          .order('slot_time', ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<BookingAvailableTimesVRow>
                                          wrapBookingAvailableTimesVRowList =
                                          snapshot.data!;

                                      return Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            wrapBookingAvailableTimesVRowList
                                                .length, (wrapIndex) {
                                          final wrapBookingAvailableTimesVRow =
                                              wrapBookingAvailableTimesVRowList[
                                                  wrapIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'OBJEDNAVKY_NOVE_DOPLNIT_TimePill_ON_TAP');
                                              logFirebaseEvent(
                                                  'TimePill_update_page_state');
                                              _model.selectedTime =
                                                  wrapBookingAvailableTimesVRow
                                                      .timeLabel;
                                              _model.progressStep = 4;
                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.timePillModels2
                                                  .getModel(
                                                '${wrapBookingAvailableTimesVRow.dateKey}-${wrapBookingAvailableTimesVRow.timeLabel}-afternoon',
                                                wrapIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: TimePillWidget(
                                                key: Key(
                                                  'Keyurp_${'${wrapBookingAvailableTimesVRow.dateKey}-${wrapBookingAvailableTimesVRow.timeLabel}-afternoon'}',
                                                ),
                                                selected: _model.selectedTime ==
                                                    wrapBookingAvailableTimesVRow
                                                        .timeLabel,
                                                disabled: false,
                                                time:
                                                    wrapBookingAvailableTimesVRow
                                                        .timeLabel,
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F2C),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.black,
                      offset: Offset(
                        0.0,
                        -4.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  shape: BoxShape.rectangle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: Container(
                            height: 101.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${valueOrDefault<String>(
                                    _model.selectedServicePrice?.toString(),
                                    '45',
                                  )}€',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dámsky strih & Styling',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                        Text(
                                          '${valueOrDefault<String>(
                                            _model.selectedDateLabel,
                                            'dátum',
                                          )}• ${valueOrDefault<String>(
                                            _model.selectedTime,
                                            'čas',
                                          )}• ${valueOrDefault<String>(
                                            _model.selectedServiceDuration
                                                ?.toString(),
                                            'trvanie služby',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFD4AF37),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ],
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'OBJEDNAVKY_NOVE_DOPLNIT_REZERVOVA_BTN_ON');
                                        if (widget!.providerId != null &&
                                            widget!.providerId != '') {
                                          if (_model.selectedServiceId !=
                                                  null &&
                                              _model.selectedServiceId != '') {
                                            if (_model.selectedDateKey !=
                                                    null &&
                                                _model.selectedDateKey != '') {
                                              if (_model.selectedTime != null &&
                                                  _model.selectedTime != '') {
                                                if (_model
                                                        .selectedServiceDuration !=
                                                    null) {
                                                  if (_model
                                                          .selectedServicePrice !=
                                                      null) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    _model.createBooking =
                                                        await BookingsTable()
                                                            .insert({
                                                      'provider_profile_id':
                                                          widget!.providerId,
                                                      'provider_service_id':
                                                          _model
                                                              .selectedServiceId,
                                                      'status': 'pending',
                                                      'duration_minutes': _model
                                                          .selectedServiceDuration,
                                                      'total_price': _model
                                                          .selectedServicePrice,
                                                      'currency_code': 'EUR',
                                                      'payment_status':
                                                          'unpaid',
                                                      'booking_date_key': _model
                                                          .selectedDateKey,
                                                      'booking_time_label':
                                                          _model.selectedTime,
                                                      'customer_email':
                                                          currentUserEmail,
                                                    });
                                                    if (_model.createBooking !=
                                                        null) {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        BookingDetailConfirmedNastaveneWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'bookingId':
                                                              serializeParam(
                                                            _model.createBooking
                                                                ?.id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Rezerváciu sa nepodarilo vytvoriť. Skúste znova.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Vyberte službu, dátum a čas rezervácie.',
                                                          style: TextStyle(),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Vyberte službu, dátum a čas rezervácie.',
                                                        style: TextStyle(),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                    ),
                                                  );
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Vyberte službu, dátum a čas rezervácie.',
                                                      style: TextStyle(),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                  ),
                                                );
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Vyberte službu, dátum a čas rezervácie.',
                                                    style: TextStyle(),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Vyberte službu, dátum a čas rezervácie.',
                                                  style: TextStyle(),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                              ),
                                            );
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Vyberte službu, dátum a čas rezervácie.',
                                                style: TextStyle(),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'rezervovať',
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconAlignment: IconAlignment.start,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
