import 'package:flutter/material.dart';
import 'package:gpa/Providers/sgpa_provider.dart';
import 'package:gpa/Screens/About_page.dart';
import 'package:gpa/Screens/GradingCriteriaScreen.dart';
import 'package:gpa/Screens/cgpa_calculator.dart';
import 'package:provider/provider.dart';
import '../widgets/subject_input_field.dart';

class SGPACalculatorScreen extends StatefulWidget {
  const SGPACalculatorScreen({super.key});

  @override
  _SGPACalculatorScreenState createState() => _SGPACalculatorScreenState();
}

class _SGPACalculatorScreenState extends State<SGPACalculatorScreen> {
  final List<Map<String, TextEditingController>> _controllers = [];

  @override
  Widget build(BuildContext context) {
    final sgpaProvider = Provider.of<SGPAProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SGPA Calculator"),
        backgroundColor: const Color(0xFF1E3C72),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    "GPA Calculator",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calculate, color: Colors.white),
                title: const Text(
                  "CGPA Calculator",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CGPACalculatorScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.grade, color: Colors.white),
                title: const Text(
                  "Grading Criteria",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GradingCriteriaScreen(),
                    ),
                  );
                },
              ),
              
            ListTile(
                leading: const Icon(Icons.info, color: Colors.white),
                title: const Text(
                  "About",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(), // Navigate to About Page
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 26, 51, 97), Color(0xFF2A5298)], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _controllers.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: ValueKey(_controllers[index]),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            _controllers.removeAt(index);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SubjectInputField(
                            percentageController: _controllers[index]['percentage']!,
                            creditHoursController: _controllers[index]['creditHours']!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _controllers.add({
                          'percentage': TextEditingController(),
                          'creditHours': TextEditingController(),
                        });
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Subject", style: TextStyle( fontSize: 16,
                        fontWeight: FontWeight.bold,),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      List<Map<String, dynamic>> subjects = _controllers.map((e) {
                        return {
                          'percentage': double.tryParse(e['percentage']!.text) ?? 0.0,
                          'creditHours': int.tryParse(e['creditHours']!.text) ?? 0,
                        };
                      }).toList();
                      sgpaProvider.calculateSGPA(subjects);
                    },
                    style: ElevatedButton.styleFrom(
                      side:  BorderSide(width: 200),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                      Icon(Icons.calculate, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Calculate SGPA",
                        style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      ],
                    ),
                    ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: AnimatedOpacity(
                    opacity: sgpaProvider.sgpa > 0 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Text(
                          "SGPA: ${sgpaProvider.sgpa.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _getMotivationalNoteBasedOnSGPA(sgpaProvider.sgpa),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getMotivationalNoteBasedOnSGPA(double sgpa) {
    if (sgpa >= 3.5) {
      return "You're a star! Keep shining! 🌟";
    } else if (sgpa >= 3.0) {
      return "Great job! You're doing amazing! 👍";
    } else if (sgpa >= 2.5) {
      return "Good effort! Keep pushing! 💪";
    } else if (sgpa >= 2.0) {
      return "Don't give up! You can do it! 🙌";
    } else {
      return "Keep trying! Every step counts! 🏃";
    }
  }
}
