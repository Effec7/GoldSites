import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'premium_gold_booking_model.dart';
export 'premium_gold_booking_model.dart';

/// Create a premium gold booking confirmation button component for the
/// GoldSites booking page.
///
/// Component name:
/// GoldBookingButton
///
/// Language:
/// Slovak only.
///
/// Purpose:
/// This button appears in the sticky bottom booking summary after the
/// customer has selected:
///
/// * service
/// * date
/// * time
///
/// The button confirms the booking.
///
/// Button text:
/// “Potvrdiť rezerváciu”
///
/// Visual style:
///
/// * full width
/// * height 52 px
/// * background must be gold
/// * use GoldSites gold: #D6B44A
/// * optional subtle gold gradient: #E0BD4F to #B9942E
/// * dark navy text: #020817
/// * bold italic text
/// * font size 16–17 px
/// * rounded corners 16–18 px
/// * subtle gold glow/shadow
/// * optional arrow icon on the right
/// * premium, sleek, compact
/// * clearly tappable
/// * do not make it huge
/// * do not make it white
/// * do not make it dark
/// * do not use purple, blue, green, or gray for the enabled state
///
/// Component parameters:
///
/// * isEnabled Boolean
/// * isLoading Boolean
/// * buttonText String
///
/// Enabled state:
/// Show when all booking data is selected.
///
/// Condition:
/// selectedServiceId is not empty
/// AND selectedDateKey is not empty
/// AND selectedTime is not empty
///
/// Enabled style:
///
/// * gold background
/// * dark navy text
/// * subtle glow
/// * text: “Potvrdiť rezerváciu”
///
/// Disabled state:
/// Show when booking data is incomplete.
///
/// Condition:
/// selectedServiceId is empty
/// OR selectedDateKey is empty
/// OR selectedTime is empty
///
/// Disabled style:
///
/// * dark muted gray background
/// * muted gray text
/// * no glow
/// * text: “Dokončite výber”
///
/// Loading state:
/// Show while the booking is being created.
///
/// Text:
/// “Vytvárame rezerváciu...”
///
/// Loading style:
///
/// * gold background
/// * dark navy text
/// * optional small loading indicator
/// * prevent double tap
///
/// Place this button inside the sticky bottom summary under the booking
/// details.
///
/// Sticky summary complete state:
/// Top row:
/// selectedServiceName on the left
/// selectedServicePrice + “ €” on the right
///
/// Subtitle:
/// selectedDateLabel + “ • ” + selectedTime + “ • ” + selectedServiceDuration
/// + “ min”
///
/// Gold button:
/// “Potvrdiť rezerváciu”
///
/// Action instructions for the parent page:
/// The action should be added on the button instance in BookServicePage, not
/// inside the component.
///
/// On tap:
///
/// 1. Check if selectedServiceId, selectedDateKey, and selectedTime are all
/// not empty.
/// 2. If incomplete, show snackbar:
///    “Vyberte službu, dátum a čas rezervácie.”
/// 3. If complete, insert a row into Supabase table bookings.
///
/// Insert values:
/// customer_user_id = Authenticated User UID
/// provider_profile_id = Page Parameter providerId
/// provider_service_id = Page State selectedServiceId
/// status = pending
/// booking_date = Page State selectedDateKey
/// booking_time = Page State selectedTime
/// duration_minutes = Page State selectedServiceDuration
/// total_price = Page State selectedServicePrice
/// currency_code = EUR
/// payment_status = unpaid
/// customer_name = Authenticated user display name or empty
/// customer_email = Authenticated user email or empty
/// customer_phone = empty
/// customer_note = empty
/// provider_note = empty
/// service_address_line = empty
/// service_city = empty
/// service_postal_code = empty
///
/// After successful insert:
/// Navigate to BookingConfirmedPage.
///
/// Pass parameters if available:
/// bookingId
/// providerId
/// selectedServiceId
/// selectedServiceName
/// selectedDateLabel
/// selectedDateKey
/// selectedTime
/// selectedServiceDuration
/// selectedServicePrice
///
/// If insert fails:
/// Show snackbar:
/// “Rezerváciu sa nepodarilo vytvoriť. Skúste to prosím znova.”
///
/// Final result:
/// A sleek, compact, premium GoldSites gold button that clearly tells the
/// customer they are confirming the reservation.
class PremiumGoldBookingWidget extends StatefulWidget {
  const PremiumGoldBookingWidget({
    super.key,
    bool? isEnabled,
    bool? isLoading,
    String? buttonText,
  })  : this.isEnabled = isEnabled ?? false,
        this.isLoading = isLoading ?? false,
        this.buttonText = buttonText ?? '';

  final bool isEnabled;
  final bool isLoading;
  final String buttonText;

  @override
  State<PremiumGoldBookingWidget> createState() =>
      _PremiumGoldBookingWidgetState();
}

class _PremiumGoldBookingWidgetState extends State<PremiumGoldBookingWidget> {
  late PremiumGoldBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumGoldBookingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget!.isEnabled ? 1.0 : 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17.0),
        child: Container(
          height: 52.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
            shape: BoxShape.rectangle,
          ),
          child: Container(
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (valueOrDefault<bool>(
                    widget!.isLoading,
                    false,
                  ))
                    Container(
                      child: Lottie.network(
                        'https://dimg.dreamflow.cloud/v1/lottie/loading+spinner',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  Text(
                    'Rezervovať službu',
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          lineHeight: 1.4,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget!.isEnabled ? false : false)
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xFF020817),
                      size: 18.0,
                    ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
