import 'package:flutter/material.dart';
import '../models/onboarding_data.dart';

class OnboardingState extends ChangeNotifier {
  final OnboardingData _data = OnboardingData();

  OnboardingData get data => _data;

  void setDob(String dob) {
    _data.dob = dob;
    notifyListeners();
  }

  void setHeightWeight(double height, double weight) {
    _data.height = height;
    _data.weight = weight;
    notifyListeners();
  }

  void setGoal(String goal) {
    _data.goal = goal;
    notifyListeners();
  }

  void setDiet(String diet, String allergies) {
    _data.dietaryPreference = diet;
    _data.allergies = allergies;
    notifyListeners();
  }

  void setCredentials(String email, String password) {
    _data.email = email;
    _data.password = password;
    notifyListeners();
  }

  void setSignupDetails({
    required String name,
    required String email,
    required String password,
  }) {
    _data.name = name;
    _data.email = email;
    _data.password = password;
    notifyListeners();
  }
  void setGender(String gender) {
  _data.gender = gender;
  notifyListeners();
}

}
