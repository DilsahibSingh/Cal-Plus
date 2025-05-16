import 'package:ai_calorie_tracker/features/onboarding/gender_Screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'state/onboarding_state.dart';
import 'features/onboarding/welcome_screen.dart';
import 'features/onboarding/dob_screen.dart';
import 'features/onboarding/height_weight_screen.dart';
import 'features/onboarding/goal_screen.dart';
import 'features/onboarding/dietary_screen.dart';
import 'features/onboarding/signup_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OnboardingState(),
      child: DevicePreview(
        enabled: true,
        builder: (context) =>CalPlusApp(),
      ),
    ),
  );
}

class CalPlusApp extends StatelessWidget {
  const CalPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (_) => const WelcomeScreen(),  
        '/dob': (_) => const DOBScreen(),
        '/gender': (_) => const GenderScreen(),   
        '/height-weight': (_) => const HeightWeightScreen(),
        '/goal': (_) => const GoalScreen(),
        '/dietary': (_) => const DietaryScreen(),
        '/signup': (_) => const SignupScreen(),
      },
    );
  }
}
