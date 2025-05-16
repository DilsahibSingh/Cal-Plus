import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../state/onboarding_state.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({super.key});

  @override
  State<DOBScreen> createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  final _controller = TextEditingController();

  void _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(data: Theme.of(context), child: child!),
    );
    if (picked != null) {
      final formatted = "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
      _controller.text = formatted;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
            Text("Enter your\ndate of birth",
              style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
            ).animate().fade().slideY(begin: 0.3),

            const SizedBox(height: 24),
            GestureDetector(
              onTap: _showDatePicker,
              child: AbsorbPointer(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "DD/MM/YYYY",
                  ),
                  style: const TextStyle(color: Colors.white),
                ).animate().fade().slideY(begin: 0.4),
              ),
            ),

            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<OnboardingState>().setDob(_controller.text);
                      Navigator.pushNamed(context, '/gender');
                    }
                  },
                  child: const Text("Next"),
                ).animate().fade().slideY(begin: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}