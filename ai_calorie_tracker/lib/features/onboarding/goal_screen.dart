import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../state/onboarding_state.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String? selectedGoal;

  void _selectGoal(String goal) {
    setState(() {
      selectedGoal = goal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
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
              Text("Select your\ngoal",
                style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
              ).animate().fade().slideY(begin: 0.3),

              const SizedBox(height: 24),
              ...["Lose weight", "Maintain weight", "Gain muscle"].map((goal) {
                final isSelected = selectedGoal == goal;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () => _selectGoal(goal),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        border: isSelected
                            ? Border.all(color: Colors.yellow, width: 2)
                            : Border.all(color: Colors.transparent),
                      ),
                      child: Center(
                        child: Text(goal,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ).animate().fade().slideY(begin: 0.4);
              }),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedGoal == null
                      ? null
                      : () {
                          context.read<OnboardingState>().setGoal(selectedGoal!);
                          Navigator.pushNamed(context, '/dietary');
                        },
                  child: const Text("Next"),
                ).animate().fade().slideY(begin: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
