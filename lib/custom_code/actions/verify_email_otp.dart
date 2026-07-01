// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> verifyEmailOtp(
  String email,
  String token,
) async {
  final supabase = Supabase.instance.client;

  try {
    final result = await supabase.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );

    return result.session != null || result.user != null;
  } catch (e) {
    return false;
  }
}
