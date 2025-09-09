
# COMSATS GPA Calculator Flutter App

A comprehensive Flutter application for calculating both Semester GPA (SGPA) and Cumulative GPA (CGPA) with an intuitive user interface and flexible grading system.

## Features

- **Semester GPA Calculator**: Calculate GPA for individual semesters by entering course percentages and credit hours
- **Cumulative GPA Calculator**: Track overall academic performance across multiple semesters
- **Flexible Input System**: Add/remove subjects and semesters dynamically
- **Comprehensive Grading System**: Supports multiple grade point scales with detailed percentage breakdowns
- **Clean UI**: Modern, user-friendly interface with easy navigation
- **Real-time Calculations**: Instant GPA computation as you input data

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/dfb0ccdf-e05d-4bda-81ae-3adc8ba4dff3" width="280" alt="SGPA Calculator">
  <img src="https://github.com/user-attachments/assets/7f27c486-fb7e-41bb-b92b-25c8f977bf58" width="280" alt="CGPA Calculator">
  <img src="https://github.com/user-attachments/assets/d7c30d1b-2b0d-446b-9a2f-09078b704bae" width="280" alt="App Logo">
  <img src="https://github.com/user-attachments/assets/4782e9db-d74c-43d9-a10f-f78da477e885" width="280" alt="Menu">
  <img src="https://github.com/user-attachments/assets/a325bc33-c763-4839-a585-66c5118548f1" width="280" alt="Grading Criteria">

</p>

<p align="center">

</p>

<p align="center">
</p>


The app includes:
1. **SGPA Calculator Screen**: Input course percentages and credit hours
2. **CGPA Calculator Screen**: Track GPAs across multiple semesters
3. **Main Menu**: Navigate between different calculator features
4. **Grading Criteria**: View detailed grading scale and formulas

## Grading Scale

| Grade | Percentage Range | Grade Points |
|-------|-----------------|--------------|
| A     | 85% and above   | 4.0          |
| B     | 75% - 84%       | 3.33 - 3.66  |
| C     | 65% - 74%       | 2.33 - 3.0   |
| D     | 50% - 64%       | 1.0 - 2.33   |
| F     | Below 50%       | 0.0          |

### Detailed Grade Points for Percentages:
- 85% and above: 4.0 (A)
- 80% - 84%: 3.66 (B)
- 75% - 79%: 3.33 (B)
- 71% - 74%: 3.0 (C)
- 68% - 70%: 2.66 (C)
- 64% - 67%: 2.33 (C)
- 61% - 63%: 2.0 (D)
- 58% - 60%: 1.66 (D)
- 54% - 57%: 1.33 (D)
- 50% - 53%: 1.0 (D)
- Below 50%: 0.0 (F)

## Calculation Formulas

### SGPA (Semester Grade Point Average)
```
SGPA = Σ(Ci × GPi) / ΣCi
```
Where:
- `Ci` = Credit Hours for course i
- `GPi` = Grade Points for course i
- `Σ` = Summation of all courses

### CGPA (Cumulative Grade Point Average)
```
CGPA = Σ(SGPAi × Ci) / ΣCi
```
Where:
- `SGPAi` = SGPA for semester i
- `Ci` = Total credit hours for semester i
- `Σ` = Summation across all semesters

### Grade Point Calculation from Percentage
The app uses a linear interpolation method to convert percentages to grade points within each grade range:

```dart
double calculateGradePoints(double percentage) {
  if (percentage >= 85) return 4.0;
  else if (percentage >= 80) return 3.66;
  else if (percentage >= 75) return 3.33;
  else if (percentage >= 71) return 3.0;
  else if (percentage >= 68) return 2.66;
  else if (percentage >= 64) return 2.33;
  else if (percentage >= 61) return 2.0;
  else if (percentage >= 58) return 1.66;
  else if (percentage >= 54) return 1.33;
  else if (percentage >= 50) return 1.0;
  else return 0.0;
}
```

## Installation

### Prerequisites
- Flutter SDK (>=2.0.0)
- Dart SDK (>=2.12.0)
- Android Studio / VS Code
- Android SDK / iOS SDK (for respective platforms)

### Steps
1. Clone the repository:
```bash
git clone https://github.com/yourusername/gpa-calculator-flutter.git
cd gpa-calculator-flutter
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── sgpa_calculator.dart  # SGPA calculation screen
│   ├── cgpa_calculator.dart  # CGPA calculation screen
│   ├── grading_criteria.dart # Grading scale display
│   └── main_menu.dart        # Navigation menu
├── models/
│   ├── course.dart           # Course data model
│   └── semester.dart         # Semester data model
├── utils/
│   └── gpa_calculator.dart   # Calculation logic
└── widgets/
    ├── course_input.dart     # Course input widget
    └── result_display.dart   # Results display widget
```

## Usage

### Calculating SGPA
1. Open the SGPA Calculator
2. Enter course percentages and credit hours
3. Use "Add Subject" to add more courses
4. Tap "Calculate SGPA" to get your semester GPA

### Calculating CGPA
1. Navigate to CGPA Calculator
2. Enter SGPA and credit hours for each semester
3. Use "Add Semester" to include more semesters
4. Tap "Calculate CGPA" to get your cumulative GPA

### Viewing Grading Criteria
- Access the grading criteria from the main menu to understand the grade point system and calculation formulas

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  # Add other dependencies as needed

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
```

## Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you find this app helpful, please consider giving it a star ⭐ on GitHub!

For issues and feature requests, please use the GitHub issues page.

## Acknowledgments

- Built with Flutter framework
- Designed for students to easily track their academic performance
- Supports standard GPA calculation methods used in educational institutions

---

**Note**: This GPA calculator follows a standard 4.0 scale. Different institutions may have varying grading systems. Please verify with your institution's specific grading policy.
