// ✅ SIGNUP SCREEN - lib/features/onboarding/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../state/onboarding_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submit() {
    final state = context.read<OnboardingState>();
    state.setSignupDetails(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // TODO: Send POST to backend
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User registered (mocked)!')),
    );
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
              Text("Sign up",
                style: theme.textTheme.displayLarge!.copyWith(fontSize: 24),
              ).animate().fade().slideY(begin: 0.3),

              const SizedBox(height: 24),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ).animate().fade().slideY(begin: 0.4),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ).animate().fade().slideY(begin: 0.45),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
              ).animate().fade().slideY(begin: 0.5),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Sign up"),
                ).animate().fade().slideY(begin: 0.55),
              ),

              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: const Text("Already have an account? Log in"),
                ),
              ).animate().fade().slideY(begin: 0.6),

              const SizedBox(height: 12),
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement Google sign-in
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Google sign-in not implemented.')),
                    );
                  },
                  icon: const Icon(Icons.login, color: Colors.white),
                  label: const Text("Sign up with Google"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ).animate().fade().slideY(begin: 0.65),
            ],
          ),
        ),
      ),
    );
  }
}