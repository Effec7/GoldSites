import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'small_premium_booking_model.dart';
export 'small_premium_booking_model.dart';

/// Create a small premium booking button component for the GoldSites app.
///
/// Component name:
/// ReserveServiceButton
///
/// Language:
/// Slovak only.
///
/// Button text:
/// “Rezervovať službu”
///
/// Icon:
/// Use a shopping cart / basket icon on the left side of the text.
///
/// Purpose:
/// This button is used on service cards or service detail sections to start
/// the booking flow. When tapped, it should take the customer to the
/// order/booking page where they choose date and time.
///
/// Visual style:
/// Use the GoldSites luxury style:
///
/// * gold button
/// * dark navy text
/// * compact size
/// * rounded corners
/// * premium but not oversized
/// * subtle shadow/glow
/// * clearly clickable
/// * elegant, modern, and clean
///
/// Exact design:
///
/// * height: 38–42 px
/// * width: fit content or around 150–175 px
/// * horizontal padding: 14–18 px
/// * border radius: 18–22 px
/// * background color: #D6B44A
/// * optional subtle gradient: #E0BD4F to #B9942E
/// * text color: #020817
/// * icon color: #020817
/// * font size: 13–14 px
/// * font weight: 700 / bold
/// * slight italic if it matches GoldSites typography
/// * icon size: 16–18 px
/// * spacing between icon and text: 6–8 px
///
/// Layout:
/// Horizontal row:
/// [cart icon] [Rezervovať službu]
///
/// The button should feel like a compact premium pill, not a large CTA block.
///
/// States:
///
/// 1. Default:
///
/// * gold background
/// * dark navy text/icon
/// * subtle glow
///
/// 2. Pressed:
///
/// * slightly darker gold
/// * very slight scale-down effect if available
///
/// 3. Disabled:
///
/// * muted dark gray background
/// * muted gray text/icon
/// * no glow
///
/// Component parameters:
///
/// * buttonText String, default “Rezervovať službu”
/// * isEnabled Boolean, default true
/// * isLoading Boolean, default false
///
/// If isLoading is true:
/// Show text:
/// “Načítava sa...”
/// Optionally show a small loading spinner instead of the cart icon.
///
/// Action instruction:
/// Do not place database insert logic inside this button.
/// This button should only navigate to the booking page.
///
/// Parent page tap action:
/// On tap, navigate to:
/// BookServicePage
///
/// Pass parameters:
///
/// * providerId = current provider profile id
/// * initialServiceId = current service id, if available
///
/// If used on a provider/business detail page:
/// providerId should come from the current provider row.
/// initialServiceId can be empty if the customer will choose service on the
/// booking page.
///
/// If used directly on a service card:
/// providerId = current service row provider_profile_id
/// initialServiceId = current service row id
///
/// Do not create a booking from this button.
/// The actual booking is created later after the customer chooses date and
/// time and taps “Potvrdiť rezerváciu”.
///
/// Important:
///
/// * Keep the button small.
/// * Do not make it full width.
/// * Do not make it taller than 42 px.
/// * Do not use white background.
/// * Do not use green, purple, or blue.
/// * Do not use English text.
/// * Do not use placeholder text.
/// * Make it look clickable and premium.
///
/// Final result:
/// A small gold pill button with a cart icon and the text “Rezervovať
/// službu”, perfectly matching the GoldSites dark navy and gold design
/// system.
class SmallPremiumBookingWidget extends StatefulWidget {
  const SmallPremiumBookingWidget({
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
  State<SmallPremiumBookingWidget> createState() =>
      _SmallPremiumBookingWidgetState();
}

class _SmallPremiumBookingWidgetState extends State<SmallPremiumBookingWidget> {
  late SmallPremiumBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallPremiumBookingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
