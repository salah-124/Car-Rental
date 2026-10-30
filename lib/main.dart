import 'package:car_rental/features/auth/login_view.dart';
import 'package:car_rental/features/auth/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gcahuxsuoyhulhexfgrf.supabase.co',
    publishableKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdjYWh1eHN1b3lodWxoZXhmZ3JmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTA4MzM4MTUsImV4cCI6MjEwNjQwOTgxNX0.MVDlm1Bmhg2x1x1HAwbPpIfG71F9dSPOE1XpgKYiLTE',
  );

  runApp(CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupView());
  }
}
