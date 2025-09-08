class GradePointCalculator {
  static double getGradePoint(double percentage) {
    if (percentage >= 85) return 4.0;
    if (percentage >= 80) return 3.66;
    if (percentage >= 75) return 3.33;
    if (percentage >= 71) return 3.0;
    if (percentage >= 68) return 2.66;
    if (percentage >= 64) return 2.33;
    if (percentage >= 61) return 2.0;
    if (percentage >= 58) return 1.66;
    if (percentage >= 54) return 1.33;
    if (percentage >= 50) return 1.0;
    return 0.0;
  }
}
