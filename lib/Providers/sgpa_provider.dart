import 'package:flutter/material.dart';
import '../models/grade_point_model.dart';

class SGPAProvider with ChangeNotifier {
  double sgpa = 0.0;
  double cgpa = 0.0;

  void calculateSGPA(List<Map<String, dynamic>> subjects) {
    double totalPoints = 0.0;
    int totalCreditHours = 0;

    for (var subject in subjects) {
      double gradePoint = GradePointCalculator.getGradePoint(subject['percentage']);
      totalPoints += gradePoint * subject['creditHours'];
      totalCreditHours += subject['creditHours'] as int;
    }

    sgpa = totalCreditHours > 0 ? totalPoints / totalCreditHours : 0.0;
    notifyListeners();
  }

  void calculateCGPA(List<Map<String, dynamic>> semesters) {
    double totalPoints = 0.0;
    int totalCreditHours = 0;

    for (var semester in semesters) {
      totalPoints += semester['gpa'] * semester['creditHours'];
      totalCreditHours += semester['creditHours'] as int;
    }

    cgpa = totalCreditHours > 0 ? totalPoints / totalCreditHours : 0.0;
    notifyListeners();
  }
}
