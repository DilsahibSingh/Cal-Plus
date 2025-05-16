// ✅ DIETARY PREFERENCE SCREEN - lib/features/onboarding/dietary_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../state/onboarding_state.dart';

class DietaryScreen extends StatefulWidget {
  const DietaryScreen({super.key});

  @override
  State<DietaryScreen> createState() => _DietaryScreenState();
}

class _DietaryScreenState extends State<DietaryScreen> {
  String selectedDiet = "No preference";
  final TextEditingController allergyController = TextEditingController();

  void _submit() {
    final state = context.read<OnboardingState>();
    state.setDiet(selectedDiet, allergyController.text.trim());
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ).animate().fade().slideX(begin: -0.2),

              const SizedBox(height: 20),
              Center(
                child: Text("Cal+", style: theme.textTheme.displayLarge),
              ).animate().fade(duration: 500.ms),

              const SizedBox(height: 40),
              Text("Dietary\npreferences",
                style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
              ).animate().fade().slideY(begin: 0.3),

              const SizedBox(height: 24),
              ...["No preference", "Vegetarian", "Vegan", "Keto"].map((diet) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: RadioListTile<String>(
                    title: Text(diet, style: const TextStyle(color: Colors.white)),
                    value: diet,
                    groupValue: selectedDiet,
                    activeColor: Colors.yellow,
                    onChanged: (val) => setState(() => selectedDiet = val!),
                    tileColor: Colors.grey[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ).animate().fade().slideY(begin: 0.4),
                );
              }),

              const SizedBox(height: 12),
              TextField(
                controller: allergyController,
                decoration: const InputDecoration(
                  hintText: "Allergies (optional)",
                ),
              ).animate().fade().slideY(begin: 0.45),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Next"),
                ).animate().fade().slideY(begin: 0.5),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
