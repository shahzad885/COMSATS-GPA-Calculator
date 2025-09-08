import 'package:flutter/material.dart';
import 'package:gpa/Providers/sgpa_provider.dart';
import 'package:provider/provider.dart';

class CGPACalculatorScreen extends StatefulWidget {
  const CGPACalculatorScreen({super.key});

  @override
  _CGPACalculatorScreenState createState() => _CGPACalculatorScreenState();
}

class _CGPACalculatorScreenState extends State<CGPACalculatorScreen> {
  final List<Map<String, TextEditingController>> _controllers = [];

  @override
  Widget build(BuildContext context) {
    final sgpaProvider = Provider.of<SGPAProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CGPA Calculator"),
        backgroundColor: const Color(0xFF1E3C72),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)], // Gradient background
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
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controllers[index]['gpa'],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "GPA",
                                    labelStyle: const TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _controllers[index]['creditHours'],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Credit Hours",
                                    labelStyle: const TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
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
                          'gpa': TextEditingController(),
                          'creditHours': TextEditingController(),
                        });
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Semester",style: TextStyle( fontSize: 16,
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
                      List<Map<String, dynamic>> semesters = _controllers.map((e) {
                        return {
                          'gpa': double.tryParse(e['gpa']!.text) ?? 0.0,
                          'creditHours': int.tryParse(e['creditHours']!.text) ?? 0,
                        };
                      }).toList();
                      sgpaProvider.calculateCGPA(semesters);
                    },
                    style: ElevatedButton.styleFrom(
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
                        "Calculate CGPA",
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
                    opacity: sgpaProvider.cgpa > 0 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "CGPA: ${sgpaProvider.cgpa.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
}
