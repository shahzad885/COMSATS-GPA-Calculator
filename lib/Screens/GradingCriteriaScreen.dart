import 'package:flutter/material.dart';

class GradingCriteriaScreen extends StatelessWidget {
  const GradingCriteriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grading Criteria"),
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
                const Text(
                  "Grading Criteria",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "A: 85% and above",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "B: 75% - 84%",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "C: 65% - 74%",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "D: 50% - 64%",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "F: Below 50%",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Formula for SGPA:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "SGPA = (Σ (Ci × GPi)) / Σ Ci",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "Where Ci = Credit Hours, GPi = Grade Points",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Grade Points for Percentage:",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "85% and above: 4.0 (A)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "80% - 84%: 3.66 (B)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "75% - 79%: 3.33 (B)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "71% - 74%: 3.0 (C)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "68% - 70%: 2.66 (C)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "64% - 67%: 2.33 (C)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "61% - 63%: 2.0 (D)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "58% - 60%: 1.66 (D)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "54% - 57%: 1.33 (D)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "50% - 53%: 1.0 (D)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const Text(
                  "Below 50%: 0.0 (F)",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
