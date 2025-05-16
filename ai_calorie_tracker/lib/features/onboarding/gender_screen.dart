import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../state/onboarding_state.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = '';

  void _submit() {
    if (selectedGender.isEmpty) return;

    final state = context.read<OnboardingState>();
    state.setGender(selectedGender);

    Navigator.pushNamed(context, '/height-weight');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ).animate().fade().slideX(begin: -0.2),

              const SizedBox(height: 20),
              // Logo
              Center(
                child: Text("Cal+", style: theme.textTheme.displayLarge),
              ).animate().fade(duration: 500.ms),

              const SizedBox(height: 40),
              // Title
              Text(
                "What is your gender?",
                style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
              ).animate().fade().slideY(begin: 0.3),

              const SizedBox(height: 24),
              // Gender Chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  "Male",
                  "Female",
                  "Non-binary",
                  "Prefer not to say",
                ].map((gender) {
                  return ChoiceChip(
                    label: Text(gender),
                    selected: selectedGender == gender,
                    onSelected: (_) {
                      setState(() => selectedGender = gender);
                    },
                    selectedColor: Colors.yellow,
                    backgroundColor: Colors.grey[900],
                    labelStyle: TextStyle(
                      color: selectedGender == gender ? Colors.black : Colors.white,
                    ),
                    side: const BorderSide(color: Colors.white30),
                  );
                }).toList(),
              ).animate().fade().slideY(begin: 0.35),

              const Spacer(),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Continue"),
                ).animate().fade().slideY(begin: 0.45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
