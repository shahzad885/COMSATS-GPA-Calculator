import 'package:flutter/material.dart';

class SubjectInputField extends StatelessWidget {
  final TextEditingController percentageController;
  final TextEditingController creditHoursController;
  final String percentageHint;
  final String creditHoursHint;

  const SubjectInputField({
    Key? key,
    required this.percentageController,
    required this.creditHoursController,
    this.percentageHint = "Percentage",
    this.creditHoursHint = "Credit Hours",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: percentageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                                    labelText: "Percentage ",
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
        )),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: creditHoursController,
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
    );
  }
}
