import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../state/onboarding_state.dart';

class HeightWeightScreen extends StatefulWidget {
  const HeightWeightScreen({super.key});

  @override
  State<HeightWeightScreen> createState() => _HeightWeightScreenState();
}

class _HeightWeightScreenState extends State<HeightWeightScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                Text(
                  "What's your\nheight and weight?",
                  style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
                ).animate().fade().slideY(begin: 0.3),

                const SizedBox(height: 24),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Height (cm)",
                  ),
                ).animate().fade().slideY(begin: 0.4),

                const SizedBox(height: 16),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Weight (kg)",
                  ),
                ).animate().fade().slideY(begin: 0.45),

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final height = double.tryParse(heightController.text);
                      final weight = double.tryParse(weightController.text);

                      if (height != null && weight != null) {
                        final state = context.read<OnboardingState>();
                        state.setHeightWeight(height, weight);
                        Navigator.pushNamed(context, '/goal');
                      }
                    },
                    child: const Text("Next"),
                  ).animate().fade().slideY(begin: 0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
